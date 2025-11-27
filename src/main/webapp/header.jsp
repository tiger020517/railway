<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>장기 기증 시스템</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Black+And+White+Picture&display=swap" rel="stylesheet">
    <style>
        @font-face { font-family: 'RoundedFixedsys'; src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_six@1.2/DungGeunMo.woff') format('woff'); font-weight: normal; font-display: swap; }
        body { font-family: 'RoundedFixedsys', monospace; background-color: #0a0a0a; color: #d4d4d4; margin: 0; padding: 20px; display: flex; flex-direction: column; align-items: center; min-height: 100vh; }
        /* Scanline 애니메이션 */
        body::before { content: " "; display: block; position: absolute; top: 0; left: 0; width: 100%; height: 100%; background: linear-gradient(rgba(18, 16, 16, 0) 50%, rgba(0, 0, 0, 0.25) 50%), linear-gradient(90deg, rgba(255, 0, 0, 0.06), rgba(0, 255, 0, 0.02), rgba(0, 0, 255, 0.06)); background-size: 100% 3px, 3px 100%; z-index: 2; pointer-events: none; animation: scanline 8s linear infinite; }
        @keyframes scanline { 0% { background-position: 0 0;} 100% { background-position: 0 100vh; } }

        /* 공통 컨테이너 스타일 */
        .content-wrapper { z-index: 3; width: 100%; max-width: 800px; position: relative; }
        a { text-decoration: none; color: #75fa69; }
        h1, h2, h3 { color: #ea3635; text-shadow: 0 0 3px red; text-align: center;}
    </style>
</head>
<body>
<div class="content-wrapper">
    <nav class="navbar navbar-dark bg-transparent border-bottom border-secondary mb-4">
        <div class="container-fluid justify-content-center">
            <a class="navbar-brand fs-3" href="list.jsp">🏥 Organ Donation System</a>
        </div>
    </nav>