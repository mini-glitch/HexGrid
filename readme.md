# HexGrid

This is a simple script for a tilemap-like structure for hexagon tiles. Each hexagon tile is a Node2D which is positioned automatically when added to the HexGrid.

The HexGrid uses axial coordinates (-y up), and assumes pointy-top hexagons.

## Usage

Copy the `HexGrid.gd` script from `src` to your project. This will add `HexGrid` to the list of node types you can create. Create a HexGrid node in the scene similar to a TileMap, and set the `Hex Size` property to the size of your hexagons. You must use the HexGrid in scripts to add/remove/get hexes on the grid.

An example is available at `src/testing/HexTest.tscn`.

## Notes on functionality
- Since each hexagon is a separate node, this lets you do whatever you want in terms of logic or rendering for a node.
- Only one object per coordinate, so if you want to handle layers/multiple nodes on a hex, you must use multiple HexGrid nodes.
- Currently lacks any function to convert world space to axial coords, so all logic will have to use axial coords when getting or manipulating hexes.
- No support for placing hexes in editor, meant for runtime adding/removing of hexes.