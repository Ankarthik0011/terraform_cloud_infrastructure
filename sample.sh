#!/bin/bash
# Update and install nginx
sudo apt update -y
sudo apt install -y nginx

# Create custom HTML content
cat <<EOF > /var/www/html/index.html
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>DevOps Lab | Karthik An</title>

  <style>
    :root {
      --primary: #00e5ff;
      --secondary: #1de9b6;
      --bg-dark: #0f172a;
      --card-bg: #020617;
      --text-main: #e5e7eb;
      --text-muted: #9ca3af;
      --border-glow: rgba(0, 229, 255, 0.3);
    }

    * {
      box-sizing: border-box;
    }

    body {
      margin: 0;
      min-height: 100vh;
      font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
      background: radial-gradient(circle at top, #020617, #000);
      display: flex;
      justify-content: center;
      align-items: center;
      color: var(--text-main);
      overflow: hidden;
    }

    /* Background grid (DevOps vibe) */
    body::before {
      content: "";
      position: absolute;
      inset: 0;
      background-image:
        linear-gradient(rgba(255,255,255,0.04) 1px, transparent 1px),
        linear-gradient(90deg, rgba(255,255,255,0.04) 1px, transparent 1px);
      background-size: 40px 40px;
      z-index: 0;
    }

    .card {
      background: var(--card-bg);
      border-radius: 16px;
      padding: 50px;
      max-width: 720px;
      width: 95%;
      box-shadow:
        0 0 40px rgba(0, 229, 255, 0.15),
        inset 0 0 0 1px var(--border-glow);
      text-align: center;
      z-index: 1;
    }

    h1 {
      font-size: 2.6em;
      color: var(--primary);
      margin-bottom: 10px;
      letter-spacing: 1px;
    }

    h2 {
      font-size: 1.3em;
      font-weight: normal;
      color: var(--text-muted);
      margin-bottom: 30px;
    }

    p {
      font-size: 1.1em;
      line-height: 1.7;
      margin: 14px 0;
      color: var(--text-main);
    }

    .highlight {
      color: var(--secondary);
      font-weight: 600;
    }

    .author {
      margin-top: 35px;
      font-size: 1.05em;
      color: var(--text-muted);
    }

    .author strong {
      color: var(--primary);
    }

    @media (max-width: 768px) {
      .card {
        padding: 35px 25px;
      }

      h1 {
        font-size: 2.1em;
      }

      h2 {
        font-size: 1.1em;
      }

      p {
        font-size: 1em;
      }
    }
  </style>
</head>

<body>
  <div class="card">
    <h1>DevOps Cloud Lab</h1>
    <h2>Terraform • NGINX • AWS</h2>

    <p>
      This lab demonstrates <span class="highlight">Infrastructure as Code</span>,
      where cloud resources are provisioned using
      <span class="highlight">Terraform</span> and configured with
      <span class="highlight">NGINX</span>.
    </p>

    <p>
      Built to practice real-world
      <span class="highlight">DevOps workflows</span>,
      <span class="highlight">automation</span>,
      and <span class="highlight">cloud infrastructure</span> concepts.
    </p>

    <div class="author">
      Created by <strong>Karthik An</strong> — DevOps Engineer
    </div>
  </div>
</body>
</html>
EOF

# Enable and restart nginx
sudo systemctl enable nginx
sudo systemctl restart nginx
