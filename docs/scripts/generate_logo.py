import os

BACK_ARROW_WIDTH = 300
BACK_ARROW_MAX_HEIGHT = 1200
BACK_ARROW_MIN_HEIGHT = 800
BACK_ARROW_TAIL_HEIGHT = 200
BACK_ARROW_TAIL_DEPTH = 100

def start_path(x0: int, y0: int) -> str:
    return f"""
    <path d="M{x0} {y0}"""

def end_path(stroke_color: str = "#000000") -> str:
    return f"""Z" fill="#00000000" stroke="{stroke_color}" stroke-width="10" stroke-linejoin="round"  stroke-linecap="round"/>"""

def close_path(stroke_color: str = "#000000") -> str:
    return f"""" fill="#00000000" stroke="{stroke_color}" stroke-width="10" stroke-linejoin="round"  stroke-linecap="round"/>"""

def line_to(x1: int, y1: int) -> str:
    return f" l{x1} {y1}"

def absolute_line_to(x1: int, y1: int) -> str:
    return f" L{x1} {y1}"


def draw_line(x0: int, y0: int, x1: int, y1: int, width: int = 10, color: str = "#000000") -> str:
    x0 = x0 + 100
    y0 = y0 + 100
    x1 = x1 + 100
    y1 = y1 + 100
    return f"""
    <line x1="{x0}" y1="{y0}" x2="{x1}" y2="{y1}" stroke="{color}" stroke-width="{width}"/>
    """

def draw_line_offset(x0: int, y0: int, dx: int, dy: int, width: int = 1, color: str = "#000000") -> str:
    x0 = x0 + 100
    y0 = y0 + 100
    x1 = x0 + dx
    y1 = y0 + dy
    return f"""
    <line x1="{x0}" y1="{y0}" x2="{x1}" y2="{y1}" stroke="{color}" stroke-width="{width}"/>
    """

def generate_logo_file(filename: str, stroke_color: str = "#000000", bg_color: str = None):
    # Target path
    script_dir = os.path.dirname(os.path.abspath(__file__))
    target_dir = os.path.abspath(os.path.join(script_dir, "..", "assets"))
    target_file = os.path.join(target_dir, filename)
    
    # Ensure directory exists
    os.makedirs(target_dir, exist_ok=True)
    
    # SVG content
    svg_content = f"""<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 1000 1400" width="100%" height="100%">
  <!-- Definitions for gradients and effects -->
  <defs>
    <linearGradient id="squareGrad" x1="0%" y1="0%" x2="100%" y2="100%">
      <stop offset="0%" stop-color="#6366f1" /> <!-- Indigo -->
      <stop offset="100%" stop-color="#ec4899" /> <!-- Pink -->
    </linearGradient>
    <filter id="dropShadow" x="-10%" y="-10%" width="120%" height="120%">
      <feDropShadow dx="0" dy="8" stdDeviation="16" flood-color="#000000" flood-opacity="0.15" />
    </filter>
  </defs>
"""
    if bg_color and bg_color != "transparent":
        svg_content += f'\n  <rect x="0" y="0" width="100%" height="100%" fill="{bg_color}"/>\n'

    svg_content += f"""
  <g id="logo-mark">
"""

    svg_content += start_path(100, 100)
    svg_content += line_to(BACK_ARROW_WIDTH, BACK_ARROW_TAIL_HEIGHT)
    svg_content += line_to(0, 300)
    svg_content += line_to(200, 0)
    svg_content += line_to(0, -500)
    svg_content += line_to(300, 600)
    svg_content += line_to(-300, 600)
    svg_content += line_to(0, -500)
    svg_content += line_to(-200, 0)
    svg_content += line_to(0, 300)
    svg_content += line_to(-BACK_ARROW_WIDTH, BACK_ARROW_TAIL_HEIGHT)
    svg_content += line_to(0, -BACK_ARROW_TAIL_HEIGHT)
    svg_content += line_to(BACK_ARROW_TAIL_DEPTH, -BACK_ARROW_TAIL_HEIGHT / BACK_ARROW_WIDTH * BACK_ARROW_TAIL_DEPTH)
    svg_content += line_to(0, -(BACK_ARROW_MAX_HEIGHT - 2 *(BACK_ARROW_TAIL_HEIGHT + BACK_ARROW_TAIL_HEIGHT / BACK_ARROW_WIDTH * BACK_ARROW_TAIL_DEPTH)))
    svg_content += absolute_line_to(100, 100 + 200)
    svg_content += end_path(stroke_color)

    svg_content += start_path(100 + BACK_ARROW_WIDTH + 200, 100)
    svg_content += line_to(150, 600)
    svg_content += line_to(-150, 600)
    svg_content += close_path(stroke_color)
    
    svg_content += """
  </g>
</svg>
"""
    with open(target_file, "w", encoding="utf-8") as f:
        f.write(svg_content)
        
    print(f"Successfully generated logo at {target_file}")

def generate_logo():
    # Legacy default logo (white background, black stroke)
    generate_logo_file("logo.svg", stroke_color="#000000", bg_color="#ffffff")
    
    # Theme-compatible logos (transparent background)
    generate_logo_file("logo-light.svg", stroke_color="#000000", bg_color=None)
    generate_logo_file("logo-dark.svg", stroke_color="#ffffff", bg_color=None)

if __name__ == "__main__":
    generate_logo()
