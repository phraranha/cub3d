# cub3d

**cub3d** is a raycasting-based 3D game project inspired by the classic Wolfenstein 3D, developed as part of the [42 School](https://www.42.fr/) curriculum. The project focuses on implementing a first-person perspective rendering engine, creating a simple game environment with textures, lighting, and player interactions.

## Table of Contents

1. [Overview](#overview)  
2. [Features](#features)  
3. [Requirements](#requirements)  
4. [Setup](#setup)  
5. [Usage](#usage)  
6. [Code Structure](#code-structure)  
7. [Credits](#credits)  

---

## Overview

cub3d challenges students to build a basic game engine using raycasting. It includes parsing a custom map file, handling textures, rendering a 3D-like environment, and enabling player movement in the virtual space.

This project consolidates fundamental concepts in computer graphics, mathematics, and software engineering, and ensures a thorough understanding of low-level programming techniques.

---

## Features

- **Raycasting Engine**: A simple implementation of raycasting for rendering a 3D-like environment.
- **Customizable Maps**: Read and parse maps described in `.cub` files.
- **Texture Mapping**: Apply textures to walls and implement directional wall rendering.
- **Player Movement**: Navigate the map with basic controls.
- **Color Customization**: Set the floor and ceiling colors using RGB values.
- **Error Handling**: Validates map configurations and detects issues like invalid map characters or improperly enclosed areas.

---

## Requirements

To compile and run cub3d, ensure your system meets the following requirements:

- **Operating System**: Linux or macOS
- **Compiler**: `gcc` or equivalent C compiler
- **Libraries**: 
  - [MLX42](https://github.com/codam-coding-college/MLX42) (graphics library)
  - [libft](https://github.com/42Paris/libft) (custom utility library provided by 42)
  - [Get Next Line](https://github.com/42Paris/gnl) (for reading file lines)

---

## Setup

### Clone the Repository

```bash
git clone https://github.com/your_username/cub3d.git
cd cub3d
```

### Install Dependencies

1. **Install MLX42**: Follow the [MLX42 installation guide](https://github.com/codam-coding-college/MLX42).
2. **Ensure libft and gnl are included**: These libraries are already submodules in the project.

### Compile the Project

Run the following command in the project root:

```bash
make
```

This will generate the `cub3d` executable.

---

## Usage

### Running the Game

To start the game, provide a valid `.cub` file as input:

```bash
./cub3d maps/example.cub
```

### Controls

- **W**: Move forward
- **S**: Move backward
- **A**: Move left
- **D**: Move right
- **Arrow Keys**: Rotate the player's view
- **ESC**: Exit the game

---

## Code Structure

### Header File: `cub3d.h`

Defines constants, macros, and all primary structures, such as:
- `t_map` for map data.
- `t_scene` for textures and map properties.
- `t_player` for player movement and position.
- `t_cub3d` for the overall game context.

### Key Files

1. **Initialization**
   - `init_values.c`: Initializes game variables.
   - `init_textures.c`: Loads textures from the `.cub` file.

2. **Map Parsing**
   - `map_parser.c`: Reads and validates map files.
   - `flood_fill.c`: Validates map enclosure using a flood-fill algorithm.

3. **Rendering**
   - `raycasting.c`: Implements the core raycasting logic.
   - `draw.c`: Draws the environment, including walls, floor, and ceiling.

4. **Movement**
   - `movement.c`: Handles player input and movement logic.

5. **Utilities**
   - `utils.c`: Helper functions for tasks like array manipulation and memory management.

6. **Error Handling**
   - `error_handling.c`: Prints error messages and cleans up resources on failure.

---

## Credits

This project was developed as part of the 42 School curriculum. Special thanks to the MLX42 developers and the creators of libft for their essential tools and libraries.
