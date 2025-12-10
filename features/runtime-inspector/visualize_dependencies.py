#!/usr/bin/env python3
"""
Dependency Graph Visualizer for FS22 Runtime Inspector
Generates an interactive graph showing relationships between global objects
"""

import json
import sys
from pathlib import Path
import networkx as nx
import matplotlib.pyplot as plt
from pyvis.network import Network
import argparse

def load_dependency_graph(json_path):
    """Load the dependency graph from JSON export"""
    with open(json_path, 'r') as f:
        return json.load(f)

def create_networkx_graph(data):
    """Create NetworkX graph from exported data"""
    G = nx.DiGraph()

    # Add nodes
    for node in data.get('nodes', []):
        G.add_node(node['id'], label=node['label'], type=node['type'])

    # Add edges
    for edge in data.get('edges', []):
        edge_type = edge.get('type', 'reference')
        color = 'red' if edge_type == 'circular' else 'gray'
        G.add_edge(edge['from'], edge['to'], type=edge_type, color=color)

    return G

def visualize_static(G, output_path):
    """Create static visualization with matplotlib"""
    plt.figure(figsize=(20, 20))

    # Layout algorithms
    pos = nx.spring_layout(G, k=2, iterations=50)

    # Draw nodes
    node_colors = ['red' if 'currentMission' in node else 'lightblue' for node in G.nodes()]
    nx.draw_networkx_nodes(G, pos, node_color=node_colors, node_size=3000, alpha=0.8)

    # Draw edges
    edge_colors = [G[u][v].get('color', 'gray') for u, v in G.edges()]
    nx.draw_networkx_edges(G, pos, edge_color=edge_colors, arrows=True,
                          arrowsize=20, arrowstyle='->', width=2, alpha=0.6)

    # Draw labels
    nx.draw_networkx_labels(G, pos, font_size=8)

    plt.title("FS22 Global Objects Dependency Graph", fontsize=16)
    plt.axis('off')
    plt.tight_layout()
    plt.savefig(output_path, dpi=300, bbox_inches='tight')
    print(f"Static graph saved to: {output_path}")

def visualize_interactive(G, output_path):
    """Create interactive HTML visualization with PyVis"""
    net = Network(height="900px", width="100%", directed=True,
                 bgcolor="#222222", font_color="white")

    # Configure physics
    net.barnes_hut(gravity=-80000, central_gravity=0.3, spring_length=100)

    # Add nodes with custom styling
    for node in G.nodes():
        node_data = G.nodes[node]
        color = '#ff6b6b' if 'currentMission' in node else '#4ecdc4'
        size = 30 if 'currentMission' in node else 20

        net.add_node(node,
                    label=node,
                    color=color,
                    size=size,
                    title=f"Type: {node_data.get('type', 'global')}")

    # Add edges with different styles for circular references
    for edge in G.edges():
        edge_data = G.edges[edge]
        if edge_data.get('type') == 'circular':
            net.add_edge(edge[0], edge[1], color='#ff0000', width=3,
                        title="CIRCULAR REFERENCE!")
        else:
            net.add_edge(edge[0], edge[1], color='#666666', width=1)

    # Add some control buttons
    net.show_buttons(filter_=['physics'])
    net.save_graph(output_path)
    print(f"Interactive graph saved to: {output_path}")

def analyze_graph(G):
    """Analyze the graph and print statistics"""
    print("\n=== Graph Analysis ===")
    print(f"Total nodes (globals): {G.number_of_nodes()}")
    print(f"Total edges (references): {G.number_of_edges()}")

    # Find circular references
    cycles = list(nx.simple_cycles(G))
    print(f"\nCircular reference chains found: {len(cycles)}")
    if cycles:
        print("Circular chains:")
        for cycle in cycles[:10]:  # Show max 10
            print(f"  {' -> '.join(cycle)} -> {cycle[0]}")

    # Most connected nodes
    degree_centrality = nx.degree_centrality(G)
    top_nodes = sorted(degree_centrality.items(), key=lambda x: x[1], reverse=True)[:10]

    print("\nMost connected globals (potential god objects):")
    for node, centrality in top_nodes:
        in_degree = G.in_degree(node)
        out_degree = G.out_degree(node)
        print(f"  {node}: {in_degree} in, {out_degree} out (centrality: {centrality:.3f})")

    # Detect clusters
    if G.number_of_nodes() > 0:
        components = list(nx.weakly_connected_components(G))
        print(f"\nConnected components: {len(components)}")
        if len(components) > 1:
            print("Isolated subsystems found - possible modular architecture")

def generate_report(G, data, output_path):
    """Generate detailed markdown report"""
    report = []
    report.append("# FS22 Runtime Architecture Analysis\n")
    report.append("## Dependency Graph Report\n")

    # Basic stats
    report.append("### Statistics\n")
    report.append(f"- **Total global objects**: {G.number_of_nodes()}\n")
    report.append(f"- **Total references**: {G.number_of_edges()}\n")

    # Circular references
    circular = data.get('circular', [])
    if circular:
        report.append("\n### ⚠️ Circular References Detected\n")
        report.append("These indicate potential architectural issues:\n")
        for ref in circular:
            report.append(f"- `{ref['from']}` ↔️ `{ref['to']}`\n")

    # God objects
    degree_centrality = nx.degree_centrality(G)
    top_nodes = sorted(degree_centrality.items(), key=lambda x: x[1], reverse=True)[:5]

    report.append("\n### 🎯 Core Objects (Highest Connectivity)\n")
    for node, centrality in top_nodes:
        in_degree = G.in_degree(node)
        out_degree = G.out_degree(node)
        report.append(f"- **{node}**: {in_degree} incoming, {out_degree} outgoing refs\n")

    # Architecture observations
    report.append("\n### 🏗️ Architecture Observations\n")

    if any('manager' in node.lower() for node in G.nodes()):
        report.append("- **Manager pattern**: Multiple manager objects detected (good separation of concerns)\n")

    if any('system' in node.lower() for node in G.nodes()):
        report.append("- **System architecture**: System-based design detected (ECS-like pattern)\n")

    if circular:
        report.append("- **⚠️ Coupling issues**: Circular dependencies suggest tight coupling\n")

    # Write report
    with open(output_path, 'w') as f:
        f.writelines(report)

    print(f"Report saved to: {output_path}")

def main():
    parser = argparse.ArgumentParser(description='Visualize FS22 dependency graph')
    parser.add_argument('input', help='Path to dependency_graph.json')
    parser.add_argument('--output-dir', default='.', help='Output directory')
    parser.add_argument('--no-interactive', action='store_true', help='Skip interactive HTML')
    parser.add_argument('--no-static', action='store_true', help='Skip static PNG')
    parser.add_argument('--no-report', action='store_true', help='Skip markdown report')

    args = parser.parse_args()

    # Load data
    data = load_dependency_graph(args.input)
    G = create_networkx_graph(data)

    output_dir = Path(args.output_dir)
    output_dir.mkdir(exist_ok=True)

    # Analyze
    analyze_graph(G)

    # Visualize
    if not args.no_static:
        visualize_static(G, output_dir / 'dependency_graph.png')

    if not args.no_interactive:
        visualize_interactive(G, output_dir / 'dependency_graph.html')

    if not args.no_report:
        generate_report(G, data, output_dir / 'architecture_report.md')

    print("\n✅ All visualizations generated successfully!")

if __name__ == '__main__':
    main()