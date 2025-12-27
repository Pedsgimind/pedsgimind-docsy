<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1"/>
  <title>Functional Abdominal Pain in Kids (Gut–Brain Pain) — Parent-Friendly Guide</title>

  <style>
    :root{
      --bg:#fbfbfd;
      --card:#ffffff;
      --ink:#1f2937;
      --muted:#6b7280;
      --brand:#0ea5e9;
      --brand2:#22c55e;
      --warn:#f59e0b;
      --danger:#ef4444;
      --soft:#eef2ff;
      --line:#e5e7eb;
      --shadow: 0 10px 25px rgba(31,41,55,.08);
      --radius:18px;
      --mono: ui-monospace, SFMono-Regular, Menlo, Monaco, Consolas, "Liberation Mono", "Courier New", monospace;
      --sans: ui-sans-serif, system-ui, -apple-system, Segoe UI, Roboto, Helvetica, Arial, "Apple Color Emoji","Segoe UI Emoji";
    }

    *{box-sizing:border-box}
    body{
      margin:0; background:linear-gradient(180deg, #f7fbff 0%, var(--bg) 45%, #fff 100%);
      color:var(--ink); font-family:var(--sans); line-height:1.55;
    }
    a{color:var(--brand); text-decoration:none}
    a:hover{text-decoration:underline}
    .wrap{max-width:1080px; margin:0 auto; padding:20px 16px 80px}
    .hero{
      background: radial-gradient(1200px 500px at 20% 0%, rgba(14,165,233,.15), transparent 55%),
                  radial-gradient(900px 500px at 80% 10%, rgba(34,197,94,.12), transparent 55%),
                  linear-gradient(180deg, #ffffff, #fbfdff);
      border:1px solid var(--line); border-radius:var(--radius); box-shadow:var(--shadow);
      padding:22px 18px;
      position:relative; overflow:hidden;
    }
    .hero h1{margin:0 0 6px; font-size: clamp(24px, 3vw, 38px); letter-spacing:-.02em}
    .hero p{margin:0; color:var(--muted); max-width:70ch}
    .pillrow{display:flex; flex-wrap:wrap; gap:8px; margin-top:14px}
    .pill{
      display:inline-flex; align-items:center; gap:8px;
      padding:8px 10px; border:1px solid var(--line);
      background:#fff; border-radius:999px; font-size:13px; color:var(--muted)
    }
    .pill b{color:var(--ink); font-weight:650}

    /* Sticky quick nav */
    .topbar{
      position:sticky; top:10px; z-index:10;
      margin:14px 0 18px; display:flex; gap:10px; flex-wrap:wrap;
      background:rgba(255,255,255,.85); backdrop-filter: blur(8px);
      border:1px solid var(--line); border-radius:999px; padding:10px 12px;
      box-shadow: 0 10px 22px rgba(31,41,55,.06);
    }
    .topbar a{
      padding:6px 10px; border-radius:999px; font-size:13px; color:var(--ink);
      border:1px solid transparent;
    }
    .topbar a:hover{border-color:var(--line); background:#fff}
    .topbar .cta{
      margin-left:auto; display:flex; gap:8px; align-items:center; flex-wrap:wrap;
    }
    .btn{
      border:none; cursor:pointer; border-radius:999px;
      padding:8px 12px; font-weight:650; font-size:13px;
      background:var(--brand); color:#fff;
    }
    .btn.secondary{background:#fff; color:var(--ink); border:1px solid var(--line)}
    .btn:active{transform:translateY(1px)}
    .btn.small{padding:6px 10px; font-size:12px}

    /* Layout */
    .grid{
      display:grid; grid-template-columns: 1.2fr .8fr; gap:16px; margin-top:16px;
    }
    @media (max-width: 900px){ .grid{grid-template-columns:1fr} .topbar .cta{margin-left:0} }

    .card{
      background:var(--card); border:1px solid var(--line); border-radius:var(--radius);
      box-shadow:var(--shadow); padding:18px;
    }
    .card h2{margin:0 0 10px; font-size:22px}
    .card h3{margin:18px 0 10px; font-size:18px}
    .card p{margin:10px 0}
    .muted{color:var(--muted)}
    .kicker{
      display:inline-block; font-size:12px; letter-spacing:.08em; text-transform:uppercase;
      color:var(--muted); margin-bottom:8px
    }

    /* At-a-glance */
    .ataglance{
      border-radius:20px; border:1px solid rgba(14,165,233,.35);
      background: linear-gradient(180deg, rgba(14,165,233,.08), rgba(34,197,94,.06));
      padding:16px; box-shadow:var(--shadow);
    }
    .ataglance h2{margin:0 0 8px}
    .ataglance .rows{display:grid; grid-template-columns:1fr 1fr; gap:10px}
    @media (max-width:700px){.ataglance .rows{grid-template-columns:1fr}}
    .mini{
      background:#fff; border:1px solid var(--line); border-radius:14px; padding:12px
    }
    .mini b{display:block; margin-bottom:6px}
    ul.clean{margin:0; padding-left:18px}
    ul.clean li{margin:6px 0}

    /* Triage boxes */
    .triage{
      display:grid; gap:10px;
      grid-template-columns: 1fr 1fr;
    }
    @media (max-width:700px){.triage{grid-template-columns:1fr}}
    .callout{
      border-radius:16px; border:1px solid var(--line); padding:14px;
      background:#fff;
    }
    .callout h4{margin:0 0 8px; font-size:16px}
    .callout p{margin:8px 0}
    .green{border-color: rgba(34,197,94,.35); background: rgba(34,197,94,.06)}
    .yellow{border-color: rgba(245,158,11,.35); background: rgba(245,158,11,.08)}
    .red{border-color: rgba(239,68,68,.35); background: rgba(239,68,68,.08)}
    .blue{border-color: rgba(14,165,233,.35); background: rgba(14,165,233,.08)}

    /* Visuals */
    .figure{
      border:1px dashed rgba(107,114,128,.55);
      border-radius:16px;
      padding:14px;
      background: linear-gradient(180deg, #fff, #fbfbff);
      overflow:hidden;
    }
    .figure .caption{
      margin-top:10px; font-size:13px; color:var(--muted)
    }
    .svgbox{background:#fff; border:1px solid var(--line); border-radius:14px; padding:12px; overflow:auto}
    .ai-prompt{
      background:#0b1220; color:#e5e7eb; border-radius:14px; padding:12px;
      font-family:var(--mono); font-size:12px; line-height:1.45; border:1px solid rgba(255,255,255,.08)
    }
    .ai-prompt b{color:#93c5fd}
    .imgph{
      width:100%; height:220px; border-radius:14px;
      border:1px solid var(--line);
      background:
        radial-gradient(400px 120px at 20% 20%, rgba(14,165,233,.18), transparent 55%),
        radial-gradient(400px 120px at 80% 40%, rgba(34,197,94,.16), transparent 55%),
        linear-gradient(180deg, #ffffff, #f6f7fb);
      display:flex; align-items:center; justify-content:center; color:var(--muted); font-weight:650;
    }
    .imgph.small{height:160px}

    /* Checklists & tables */
    .checklist{
      background:#fff; border:1px solid var(--line); border-radius:14px; padding:12px;
    }
    .checklist label{display:flex; gap:10px; padding:8px; border-radius:12px}
    .checklist label:hover{background:#f9fafb}
    .checklist input{margin-top:3px}
    table{
      width:100%; border-collapse:separate; border-spacing:0;
      border:1px solid var(--line); border-radius:14px; overflow:hidden; background:#fff;
    }
    th,td{padding:10px 10px; border-bottom:1px solid var(--line); vertical-align:top; font-size:14px}
    th{background:#f8fafc; text-align:left}
    tr:last-child td{border-bottom:none}
    .tag{
      display:inline-block; padding:4px 8px; border-radius:999px; border:1px solid var(--line);
      font-size:12px; color:var(--muted); background:#fff;
    }

    /* FAQ accordion */
    details{
      border:1px solid var(--line); border-radius:14px; background:#fff; padding:12px;
      margin:10px 0;
    }
    summary{cursor:pointer; font-weight:700}
    details p{margin:10px 0 0}

    /* Printable blocks */
    .printables{
      display:grid; grid-template-columns:1fr 1fr; gap:12px;
    }
    @media (max-width:900px){.printables{grid-template-columns:1fr}}
    .printblock{
      border:2px solid #111827; border-radius:16px; padding:14px; background:#fff;
    }
    .printblock h3{margin:0 0 10px}
    .printblock .hint{font-size:12px; color:var(--muted)}
    .fill{
      border:1px dashed #6b7280; border-radius:12px; padding:10px; min-height:44px; margin:8px 0;
    }

    /* Credential box */
    .credential{
      border:3px solid #111827;
      border-radius:18px;
      padding:18px;
      background: linear-gradient(180deg, #fff, #f9fafb);
      font-family: var(--sans);
      box-shadow: 0 14px 30px rgba(31,41,55,.12);
    }
    .credential pre{
      margin:0;
      font-family: var(--sans);
      white-space: pre-wrap;
      line-height:1.4;
      font-weight:700;
      letter-spacing:.01em;
    }

    /* Print */
    @media print{
      .topbar, .btn, .pillrow{display:none !important}
      body{background:#fff}
      .hero, .card, .ataglance{box-shadow:none}
      a{color:#000; text-decoration:none}
      .wrap{padding:0}
      .card{page-break-inside:avoid}
      details{page-break-inside:avoid}
      .printblock{page-break-inside:avoid}
    }
  </style>
</head>

<body>
  <div class="wrap">
    <!-- HERO -->
    <header class="hero" id="top">
      <div class="kicker">Parent Guide • Pediatric Gastroenterology • Practical + Reassuring</div>
      <h1>✅ Functional Abdominal Pain in Kids (Gut–Brain Pain)</h1>
      <p>
        This is a common cause of recurrent belly pain in children. It is <b>real pain</b>—but it usually happens
        because the <b>gut and nervous system are extra sensitive</b>, not because something dangerous is being missed.
        This guide helps you know what to do today, when to worry, and what to expect next.
      </p>
      <div class="pillrow" aria-label="Quick facts">
        <div class="pill">🧠🫃 <b>Gut–brain</b> connection</div>
        <div class="pill">📅 Often lasts <b>weeks–months</b></div>
        <div class="pill">🏫 School impact is common</div>
        <div class="pill">🩺 Tests often <b>not needed</b> if no red flags</div>
        <div class="pill">💛 Treatable with routines + skills</div>
      </div>
    </header>

    <!-- STICKY NAV -->
    <nav class="topbar" aria-label="Page navigation">
      <a href="#ataglance">At-a-glance</a>
      <a href="#what">What it is</a>
      <a href="#symptoms">Symptoms</a>
      <a href="#homecare">Home care</a>
      <a href="#triage">When to worry</a>
      <a href="#diagnosis">Diagnosis</a>
      <a href="#treatment">Treatment</a>
      <a href="#printables">Printables</a>
      <div class="cta">
        <button class="btn small" onclick="window.print()">🖨️ Print / Save as PDF</button>
        <button class="btn small secondary" onclick="document.getElementById('faq').scrollIntoView({behavior:'smooth'})">❓ Jump to FAQs</button>
      </div>
    </nav>

    <!-- 1) AT-A-GLANCE -->
    <section class="ataglance" id="ataglance">
      <h2>1) 🧾 Quick “At-a-glance” box</h2>
      <div class="rows">
        <div class="mini">
          <b>Condition name + common names</b>
          Functional Abdominal Pain (FAP), “recurrent belly pain,” “gut–brain pain,” “sensitive tummy,” sometimes part of
          functional gastrointestinal disorders (FGIDs).
        </div>
        <div class="mini">
          <b>2–3 line plain-language summary</b>
          The gut has its own nerves. In some kids, those nerves become <b>extra sensitive</b> and the brain “turns up the volume.”
          Pain can feel strong even when tests look normal. Most children improve with the right plan.
        </div>
        <div class="mini">
          <b>Who it affects (typical ages)</b>
          Most common in <b>school-age kids and teens</b>, but can occur in toddlers too—especially during stressful transitions.
        </div>
        <div class="mini">
          <b>What parents should do today</b>
          <ul class="clean">
            <li>✅ Check for red flags (below).</li>
            <li>🗓️ Start a simple symptom diary (timing, triggers, stool, meals, sleep).</li>
            <li>💧 Support hydration + regular meals + gentle movement.</li>
            <li>🏫 Keep routines and school attendance as much as possible.</li>
            <li>📞 Book a clinic visit if pain is frequent or affecting life.</li>
          </ul>
        </div>
        <div class="mini">
          <b>🚨 Red flags that need urgent/ER care</b>
          <ul class="clean">
            <li>🔴 Severe, worsening, or one-sided belly pain (especially right-lower belly)</li>
            <li>🔴 Bilious (green) vomiting, repeated vomiting, or cannot keep fluids down</li>
            <li>🔴 Blood in stool or black/tarry stool</li>
            <li>🔴 High fever with belly pain, very sleepy or hard to wake</li>
            <li>🔴 Dehydration: very dry mouth, no tears, very little urine</li>
            <li>🔴 Swollen belly + severe pain</li>
            <li>🔴 Unexplained weight loss, persistent nighttime waking from pain</li>
          </ul>
        </div>
        <div class="mini">
          <b>When to see the family doctor/clinic</b>
          <ul class="clean">
            <li>🟡 Pain happens weekly or more, or lasts &gt; 2–4 weeks</li>
            <li>🟡 School refusal, missed activities, or sleep disruption</li>
            <li>🟡 Constipation, diarrhea, reflux symptoms, or frequent nausea</li>
            <li>🟡 Anxiety around meals, toileting, or fear of pain</li>
            <li>🟡 Family history: celiac disease, inflammatory bowel disease</li>
          </ul>
        </div>
      </div>
      <p class="muted" style="margin-top:12px">
        💡 Quick reassurance: functional abdominal pain is common and real. The goal is to <b>reduce pain</b> and also <b>restore normal life</b>.
      </p>
    </section>

    <div class="grid">
      <!-- MAIN COLUMN -->
      <main class="card">

        <!-- 2) WHAT IT IS -->
        <section id="what">
          <div class="kicker">Section 2</div>
          <h2>2) 🫃 What it is (plain language)</h2>
          <p>
            <b>Functional abdominal pain</b> means your child has belly pain that is <b>not caused by an emergency problem</b> like appendicitis,
            and usually not caused by a dangerous disease. Instead, the gut is <b>extra sensitive</b>, and the nerves in the gut + brain
            can “amplify” normal sensations (like gas, stretching, or digestion).
          </p>

          <div class="figure">
            <h3>🧩 What part of the body is involved (simple diagram)</h3>

            <!-- SIMPLE LABELED BODY-PART DIAGRAM (SVG) -->
            <div class="svgbox" role="img" aria-label="Simple labeled diagram of gut-brain connection and intestines">
              <svg width="920" height="320" viewBox="0 0 920 320" xmlns="http://www.w3.org/2000/svg">
                <defs>
                  <style>
                    .t{font: 14px system-ui, -apple-system, Segoe UI, Roboto, Helvetica, Arial;}
                    .h{font: 18px system-ui, -apple-system, Segoe UI, Roboto, Helvetica, Arial; font-weight:700;}
                  </style>
                </defs>

                <rect x="0" y="0" width="920" height="320" rx="14" fill="#ffffff"/>
                <text x="20" y="32" class="h">Gut–Brain Connection (simple)</text>

                <!-- Brain -->
                <circle cx="160" cy="120" r="55" fill="#e0f2fe" stroke="#0ea5e9" stroke-width="2"/>
                <text x="135" y="125" class="t" fill="#0f172a">Brain</text>

                <!-- Nerve line -->
                <path d="M215 130 C 300 160, 320 170, 380 190" fill="none" stroke="#0ea5e9" stroke-width="4" stroke-linecap="round"/>
                <text x="250" y="175" class="t" fill="#0f172a">Nerve signals</text>

                <!-- Stomach -->
                <path d="M460 110
                         C 430 70, 510 55, 520 105
                         C 530 165, 460 165, 450 145
                         C 440 125, 470 130, 460 110 Z"
                      fill="#dcfce7" stroke="#22c55e" stroke-width="2"/>
                <text x="460" y="190" class="t" fill="#0f172a">Stomach</text>

                <!-- Intestines -->
                <rect x="560" y="80" width="300" height="180" rx="18" fill="#eef2ff" stroke="#6366f1" stroke-width="2"/>
                <path d="M590 110 h240 v30 h-240 v30 h240 v30 h-240 v30 h240" fill="none" stroke="#6366f1" stroke-width="6" stroke-linecap="round"/>
                <text x="650" y="270" class="t" fill="#0f172a">Small + Large Intestine</text>

                <!-- Sensitivity label -->
                <rect x="360" y="220" width="520" height="70" rx="14" fill="#fff7ed" stroke="#f59e0b" stroke-width="2"/>
                <text x="380" y="248" class="t" fill="#0f172a">
                  In functional pain, the gut nerves can be extra sensitive →
                </text>
                <text x="380" y="270" class="t" fill="#0f172a">
                  normal digestion may feel painful (the “volume knob” is turned up).
                </text>
              </svg>
            </div>

            <div class="caption">
              🟢 Parent translation: Your child’s digestive tract (stomach/intestines) and the nervous system are “talking.” When that system is sensitive, pain can happen even without damage.
            </div>
          </div>

          <h3>🙃 Common myths vs facts</h3>
          <ul class="clean">
            <li><b>Myth:</b> “If tests are normal, the pain is fake.” <br><b>Fact:</b> The pain is real. The nervous system can create strong pain signals without visible damage.</li>
            <li><b>Myth:</b> “It’s just anxiety.” <br><b>Fact:</b> Stress can worsen symptoms, but many kids have functional pain even when life is calm.</li>
            <li><b>Myth:</b> “We must find the one food causing it.” <br><b>Fact:</b> Sometimes food triggers exist, but many kids improve more with routines + skills than with strict restriction.</li>
          </ul>
        </section>

        <!-- 3) WHY IT HAPPENS -->
        <section id="why">
          <div class="kicker">Section 3</div>
          <h2>3) 🔍 Why it happens (causes & triggers)</h2>

          <h3>✅ Common causes (the “big three”)</h3>
          <ul class="clean">
            <li>🧠 <b>Gut–brain sensitivity:</b> nerves in the gut over-react to stretching, gas, or normal digestion.</li>
            <li>🦠 <b>Post-infection sensitivity:</b> pain starts after a stomach bug (even when the infection is gone).</li>
            <li>🚽 <b>Constipation:</b> stool buildup stretches the bowel and can trigger ongoing pain.</li>
          </ul>

          <h3>🟡 Less common but important causes (brief)</h3>
          <ul class="clean">
            <li>🌾 Celiac disease (gluten-triggered immune condition)</li>
            <li>🧫 Inflammatory bowel disease (Crohn’s/ulcerative colitis)</li>
            <li>🧪 Lactose intolerance or other carbohydrate intolerance</li>
            <li>🩺 Acid reflux or gastritis (depending on symptoms)</li>
          </ul>

          <h3>🔥 Triggers that worsen symptoms</h3>
          <ul class="clean">
            <li>Skipping meals, very large meals, or eating very fast</li>
            <li>Not enough sleep or irregular sleep schedules</li>
            <li>Constipation or holding stool at school</li>
            <li>Stressful transitions (new school, exams, travel)</li>
            <li>Some foods for some kids (greasy, very spicy, lots of carbonation, high sorbitol)</li>
          </ul>

          <h3>🎯 Risk factors</h3>
          <ul class="clean">
            <li>Age: school-age and teens</li>
            <li>Family history of functional GI disorders, migraines, anxiety</li>
            <li>History of constipation or prior gastroenteritis</li>
            <li>High “body awareness” (kids who feel sensations strongly)</li>
          </ul>
        </section>

        <!-- 4) SYMPTOMS -->
        <section id="symptoms">
          <div class="kicker">Section 4</div>
          <h2>4) 👀 What parents might notice (symptoms)</h2>

          <h3>✅ Typical symptoms (most common first)</h3>
          <ul class="clean">
            <li>📍 Belly pain around the belly button or “all over”</li>
            <li>⏱️ Pain comes and goes (often daily or several times a week)</li>
            <li>🍽️ Pain around meals (before, during, or after)</li>
            <li>💨 Bloating, gas, or feeling “too full”</li>
            <li>🤢 Nausea (sometimes) without persistent vomiting</li>
            <li>🚽 Constipation or alternating constipation/looser stools</li>
          </ul>

          <h3>👶👧🧑 Symptoms by age group</h3>
          <table aria-label="Symptoms by age group">
            <thead>
              <tr>
                <th>Age group</th>
                <th>What it can look like</th>
                <th>Helpful parent note</th>
              </tr>
            </thead>
            <tbody>
              <tr>
                <td><b>Infants</b> (rare)</td>
                <td>Fussiness, arching, crying after feeds</td>
                <td>Infants with persistent distress need a clinician check to rule out feeding issues, reflux, or cow’s milk protein allergy.</td>
              </tr>
              <tr>
                <td><b>Toddlers</b></td>
                <td>“Tummy hurts,” clinginess, picky eating, stool holding</td>
                <td>Look closely for constipation (hard stools, painful poops, stool accidents).</td>
              </tr>
              <tr>
                <td><b>School-age</b></td>
                <td>Morning pain, school avoidance, pain after meals</td>
                <td>Morning anxiety + constipation are common drivers.</td>
              </tr>
              <tr>
                <td><b>Teens</b></td>
                <td>Chronic pain, nausea, fatigue, stress sensitivity</td>
                <td>Sleep, regular meals, and skill-based therapy (CBT) can be powerful.</td>
              </tr>
            </tbody>
          </table>

          <h3>🟢 What’s normal vs what’s not normal</h3>
          <div class="triage">
            <div class="callout green">
              <h4>🟢 Often “okay” (but still deserves support)</h4>
              <ul class="clean">
                <li>Pain that comes/goes and child looks well between episodes</li>
                <li>Normal growth and energy overall</li>
                <li>No blood in stool and no persistent vomiting</li>
              </ul>
            </div>
            <div class="callout red">
              <h4>🔴 Not normal (get medical help)</h4>
              <ul class="clean">
                <li>Weight loss or slowed growth</li>
                <li>Blood in stool, black stool, or frequent diarrhea at night</li>
                <li>Persistent fever, waking from sleep due to pain often</li>
                <li>Severe localized pain or bilious (green) vomiting</li>
              </ul>
            </div>
          </div>

          <h3>📝 Symptom trackers (what to write down)</h3>
          <p class="muted">Bring this to your appointment—it helps your clinician decide if testing is needed and what treatment to try first.</p>

          <div class="figure">
            <div class="imgph small">📊 Symptom Timeline Placeholder</div>
            <!-- AI IMAGE PROMPT: Create a friendly, non-scary symptom timeline graphic for parents: days of week on x-axis, pain level 0-10 on y-axis, with icons for meals, stool, sleep, stress, and school. Use soft colors and clear labels. -->
            <img src="/images/functional-abdominal-pain-timeline-placeholder-1.png" alt="Symptom timeline placeholder for functional abdominal pain" style="display:none"/>
            <div class="ai-prompt">
              <b><!-- AI IMAGE PROMPT:</b> Friendly “1-week symptom timeline” infographic for parents: Pain score (0–10), meals, stool type (Bristol icons), sleep hours, stress events, school attendance. Soft pastel palette, pediatric clinic style, simple icons, not scary. --&gt;
            </div>
          </div>

          <table aria-label="Symptom diary fields">
            <thead>
              <tr>
                <th>Track this</th>
                <th>Examples</th>
              </tr>
            </thead>
            <tbody>
              <tr>
                <td>⏰ Timing</td>
                <td>Morning vs after meals vs bedtime; how long each episode lasts</td>
              </tr>
              <tr>
                <td>📍 Location</td>
                <td>Belly button area vs right lower side vs all over</td>
              </tr>
              <tr>
                <td>📈 Severity</td>
                <td>0–10 scale; can they still play/school?</td>
              </tr>
              <tr>
                <td>🚽 Stool</td>
                <td>Frequency; hard/painful; stool accidents; diarrhea</td>
              </tr>
              <tr>
                <td>🍽️ Food</td>
                <td>Skipping meals, large meals, carbonated drinks, greasy foods</td>
              </tr>
              <tr>
                <td>😴 Sleep</td>
                <td>Bedtime, wake time, nighttime waking due to pain</td>
              </tr>
              <tr>
                <td>🌧️ Stress/changes</td>
                <td>School tests, bullying, family changes, travel</td>
              </tr>
              <tr>
                <td>🚩 Red flags</td>
                <td>Fever, vomiting, blood in stool, weight loss</td>
              </tr>
            </tbody>
          </table>
        </section>

        <!-- 5) HOME CARE -->
        <section id="homecare">
          <div class="kicker">Section 5</div>
          <h2>5) 🏡 Home care and what helps (step-by-step)</h2>

          <h3>⏱️ What to do in the first 24–48 hours</h3>
          <div class="checklist" aria-label="First 48 hours checklist">
            <label><input type="checkbox"> ✅ Check red flags (vomiting, fever, blood in stool, severe localized pain).</label>
            <label><input type="checkbox"> 💧 Encourage regular fluids (water; oral rehydration if needed).</label>
            <label><input type="checkbox"> 🍽️ Keep meals small + regular (avoid skipping meals).</label>
            <label><input type="checkbox"> 🚽 Make a “no-rush toilet time” after breakfast and after dinner.</label>
            <label><input type="checkbox"> 😴 Prioritize sleep (consistent bedtime/wake time).</label>
            <label><input type="checkbox"> 🧘 Try one calming skill (belly breathing, guided imagery).</label>
          </div>

          <h3>💧🍲😴 Supportive care: fluids, nutrition, sleep, comfort</h3>
          <ul class="clean">
            <li><b>Fluids:</b> regular water sips. If nausea is present: smaller sips more often.</li>
            <li><b>Food:</b> aim for predictable meals/snacks. For many kids, <b>smaller meals</b> help more than strict elimination diets.</li>
            <li><b>Comfort:</b> warm pack on belly, gentle stretch, quiet activity (drawing, audiobook).</li>
            <li><b>Sleep:</b> consistent sleep reduces gut sensitivity. Avoid large meals right before bed.</li>
          </ul>

          <h3>🧻 Practical routines (toileting)</h3>
          <ul class="clean">
            <li>🚽 “Sit time” 5–10 minutes after breakfast and dinner (feet supported on a stool).</li>
            <li>📅 Praise effort, not results (“Thanks for sitting and trying”).</li>
            <li>🧠 Remind: “Your body needs practice. This is training, not a test.”</li>
          </ul>

          <h3>🚫 What usually makes it worse</h3>
          <ul class="clean">
            <li>Skipping breakfast; irregular eating</li>
            <li>Over-focusing on pain (“Are you okay?” every 10 minutes)</li>
            <li>Staying home repeatedly (the pain–fear–avoid cycle grows)</li>
            <li>Constipation not treated</li>
            <li>Very restrictive diets without clinician guidance</li>
          </ul>

          <div class="figure">
            <div class="imgph">🧩 Home-Care Steps Infographic Placeholder</div>
            <!-- AI IMAGE PROMPT: Create a friendly “3-step home plan” infographic: 1) Check red flags, 2) Keep routines (meals/sleep/school), 3) Calm the gut-brain (breathing/CBT skills). Include icons, soft colors, parent-friendly. -->
            <img src="/images/functional-abdominal-pain-home-steps-placeholder-2.png" alt="Home-care steps infographic placeholder" style="display:none"/>
            <div class="ai-prompt">
              <b><!-- AI IMAGE PROMPT:</b> Non-scary infographic: “3-Step Plan for Recurrent Belly Pain.” Step 1: Red flags check (ER icons). Step 2: Routines (meal, sleep, toilet, school). Step 3: Calm skills (breathing, guided imagery, CBT). Kid-friendly icons, soft palette, clear headings. --&gt;
            </div>
          </div>
        </section>

        <!-- 6) WHAT NOT TO DO -->
        <section id="not">
          <div class="kicker">Section 6</div>
          <h2>6) ⛔ What NOT to do (common mistakes)</h2>

          <h3>🚫 Unsafe treatments parents commonly try</h3>
          <ul class="clean">
            <li>Using leftover antibiotics or someone else’s prescription medicine</li>
            <li>Using frequent laxatives or enemas without a plan from your clinician</li>
            <li>Repeatedly starting/stopping multiple supplements at once (hard to know what helps)</li>
            <li>Putting a child on a very restricted diet without supervision (risk of poor nutrition)</li>
          </ul>

          <h3>🧾 “Avoid unless your clinician told you” list</h3>
          <ul class="clean">
            <li>High-dose herbal products (unknown purity and dosing)</li>
            <li>Frequent NSAIDs (like ibuprofen) for chronic belly pain unless advised (can irritate stomach)</li>
            <li>Long-term acid blockers “just in case” without a diagnosis</li>
          </ul>

          <h3>⚠️ When not to give over-the-counter medications</h3>
          <ul class="clean">
            <li>Do not use medicines “to stop diarrhea” unless your clinician recommends (depends on cause).</li>
            <li>Do not use laxatives in toddlers/young children without guidance if you are unsure about constipation vs other problems.</li>
            <li>Always check age/weight dosing instructions and avoid “adult” doses.</li>
          </ul>
        </section>

        <!-- 7) TRIAGE -->
        <section id="triage">
          <div class="kicker">Section 7</div>
          <h2>7) 🚦 When to worry: triage guidance</h2>

          <div class="triage">
            <div class="callout red">
              <h4>🚑 Call 911 / Emergency now</h4>
              <ul class="clean">
                <li>Child is very sleepy/hard to wake, pale/blue, struggling to breathe</li>
                <li>Severe belly pain + stiff belly or cannot stand straight</li>
                <li>Bilious (green) vomiting or vomiting blood</li>
              </ul>
              <p><b>Example:</b> “My child has sudden severe pain on one side, is curled up, and is vomiting green fluid.” → Emergency.</p>
            </div>

            <div class="callout yellow">
              <h4>🏥 Same-day urgent visit</h4>
              <ul class="clean">
                <li>Moderate–severe pain that is worsening over hours</li>
                <li>Fever + belly pain</li>
                <li>Repeated vomiting or cannot keep fluids down</li>
                <li>Blood in stool</li>
                <li>Dehydration signs</li>
              </ul>
              <p><b>Example:</b> “Pain started today and keeps getting worse, with fever and no appetite.” → Same-day evaluation.</p>
            </div>

            <div class="callout blue">
              <h4>📅 Book a routine appointment</h4>
              <ul class="clean">
                <li>Pain weekly or more for &gt;2–4 weeks</li>
                <li>School or activities are affected</li>
                <li>Constipation symptoms or stool accidents</li>
                <li>Ongoing nausea or reflux symptoms</li>
              </ul>
              <p><b>Example:</b> “Belly pain most mornings, missing school once a week, otherwise well.” → Book visit and start diary.</p>
            </div>

            <div class="callout green">
              <h4>🏡 Watch at home</h4>
              <ul class="clean">
                <li>Mild pain that improves with comfort measures</li>
                <li>Normal energy between episodes</li>
                <li>No red flags, normal appetite overall, normal growth</li>
              </ul>
              <p><b>Example:</b> “Mild belly aches after big meals, better with smaller meals and toilet routine.” → Home plan + monitor.</p>
            </div>
          </div>
        </section>

        <!-- 8) DIAGNOSIS -->
        <section id="diagnosis">
          <div class="kicker">Section 8</div>
          <h2>8) 🩺 How doctors diagnose it (what to expect)</h2>

          <h3>🗣️ What the clinician will ask</h3>
          <ul class="clean">
            <li>When the pain started, how often, and what it feels like</li>
            <li>Any red flags (weight loss, blood, fever, vomiting)</li>
            <li>Stool pattern (constipation, diarrhea, accidents)</li>
            <li>Food pattern (skipping meals, large meals, triggers)</li>
            <li>Sleep, stress, school impact</li>
            <li>Family history (celiac, IBD, migraines)</li>
          </ul>

          <h3>🧑‍⚕️ Physical exam basics</h3>
          <ul class="clean">
            <li>Growth and weight trend</li>
            <li>Abdominal exam (tenderness, stool buildup, swelling)</li>
            <li>Signs of anemia, dehydration, mouth ulcers, rashes, joint swelling</li>
          </ul>

          <h3>🧪 Possible tests (and why)</h3>
          <p class="muted">Tests depend on symptoms and red flags. Many children do not need extensive testing.</p>
          <ul class="clean">
            <li><b>Blood tests</b> (if needed): anemia/inflammation, celiac screening</li>
            <li><b>Stool tests</b> (if needed): inflammation markers or infection</li>
            <li><b>Urine test</b>: urinary infection can mimic belly pain</li>
          </ul>

          <h3>✅ What tests are usually not needed (helps reduce anxiety)</h3>
          <ul class="clean">
            <li>CT scans are rarely needed for recurrent functional pain (avoid radiation unless urgent reasons).</li>
            <li>Repeated imaging for long-standing pain with normal growth and no red flags is often unhelpful.</li>
          </ul>

          <h3>📌 What results might mean (simple)</h3>
          <ul class="clean">
            <li><b>Normal results</b> + no red flags → supports functional abdominal pain diagnosis.</li>
            <li><b>Abnormal celiac test</b> → may need confirmation and dietary plan with clinician.</li>
            <li><b>Inflammation markers high</b> → clinician may investigate IBD or other causes.</li>
          </ul>
        </section>

        <!-- 9) TREATMENT -->
        <section id="treatment">
          <div class="kicker">Section 9</div>
          <h2>9) 💊 Treatment options</h2>

          <p>
            The best treatment is usually a <b>package</b> (not one magic medicine):
            <span class="tag">routine</span> <span class="tag">constipation plan</span> <span class="tag">calming skills</span>
            <span class="tag">gradual return to activities</span>.
          </p>

          <h3>✅ First-line treatment</h3>
          <ul class="clean">
            <li><b>Regular schedule:</b> meals, sleep, school attendance, toilet routine</li>
            <li><b>Constipation treatment</b> if present (common hidden driver)</li>
            <li><b>Gut–brain skills:</b> diaphragmatic breathing, guided imagery, CBT strategies</li>
            <li><b>Gentle movement:</b> daily walking or play reduces gut sensitivity</li>
          </ul>

          <h3>🟡 If not improving (next steps)</h3>
          <ul class="clean">
            <li>Review stool pattern carefully; adjust constipation plan if needed</li>
            <li>Consider structured therapy (CBT) and/or a pediatric pain program</li>
            <li>Targeted dietary trials under supervision (for example, lactose trial or low-FODMAP guidance with dietitian if appropriate)</li>
            <li>Clinician may consider a medication trial based on symptom pattern</li>
          </ul>

          <h3>🔴 Severe cases (hospital care)</h3>
          <ul class="clean">
            <li>Severe dehydration, persistent vomiting, severe pain with red flags</li>
            <li>Hospital care focuses on fluids, pain control, and ruling out urgent causes</li>
          </ul>

          <h3>Medication / treatment details (parent-friendly)</h3>
          <p class="muted">
            Below are common options clinicians may use depending on the child’s symptom pattern. Always follow your clinician’s instructions.
            (This page does not replace personalized dosing advice.)
          </p>

          <table aria-label="Treatment options table">
            <thead>
              <tr>
                <th>Treatment</th>
                <th>What it does</th>
                <th>How to give it (tips)</th>
                <th>Common side effects</th>
                <th>Serious (rare) — stop & seek help</th>
                <th>Key interactions</th>
              </tr>
            </thead>
            <tbody>
              <tr>
                <td><b>Constipation plan</b> (often includes stool softener)</td>
                <td>Relieves stool buildup and bowel stretch that can trigger pain</td>
                <td>Give regularly as prescribed; aim for soft daily stools; keep toilet routine</td>
                <td>Gas, looser stools</td>
                <td>Severe belly swelling, persistent vomiting, blood in stool</td>
                <td>Tell clinician about other laxatives/supplements</td>
              </tr>
              <tr>
                <td><b>Acid reduction</b> (if reflux-like symptoms)</td>
                <td>Reduces acid-related irritation for select symptom patterns</td>
                <td>Usually taken before meals; do not start long-term without clinician guidance</td>
                <td>Headache, diarrhea/constipation</td>
                <td>Allergic reaction, persistent severe diarrhea</td>
                <td>Some medicines need stomach acid to absorb; ask pharmacist</td>
              </tr>
              <tr>
                <td><b>Antispasmodic</b> (selected cases)</td>
                <td>Calms bowel muscle spasms in some children</td>
                <td>Use only as prescribed; often short-term or as-needed</td>
                <td>Dry mouth, dizziness</td>
                <td>Urinary retention, severe dizziness/fainting</td>
                <td>Other sedating meds may increase side effects</td>
              </tr>
              <tr>
                <td><b>Peppermint oil</b> (some IBS-type pain)</td>
                <td>May relax gut muscles and reduce pain for some kids</td>
                <td>Use child-appropriate product; avoid in reflux-prone kids unless advised</td>
                <td>Heartburn, mint burps</td>
                <td>Wheezing/allergic reaction</td>
                <td>Can worsen reflux; discuss if GERD symptoms</td>
              </tr>
              <tr>
                <td><b>CBT / gut–brain therapy</b></td>
                <td>Teaches skills that reduce pain sensitivity + fear/avoid cycles</td>
                <td>Weekly sessions for several weeks; practice at home is key</td>
                <td>None physical; can feel challenging at first</td>
                <td>—</td>
                <td>Works alongside medical care</td>
              </tr>
            </tbody>
          </table>

          <div class="figure">
            <div class="imgph">🧠 “Pain Volume Knob” Diagram Placeholder</div>
            <!-- AI IMAGE PROMPT: Create a friendly diagram showing a “volume knob” labeled Pain Sensitivity, with arrows for sleep, stress, constipation, and coping skills affecting the knob. Use non-scary icons and clean labels. -->
            <img src="/images/functional-abdominal-pain-volume-knob-placeholder-3.png" alt="Pain volume knob diagram placeholder" style="display:none"/>
            <div class="ai-prompt">
              <b><!-- AI IMAGE PROMPT:</b> Simple diagram: a “volume knob” titled “Pain Sensitivity.” Icons around it: sleep (turns down), routines (down), breathing/CBT (down), constipation (up), stress (up), skipped meals (up). Soft colors, kid/parent-friendly, not scary. --&gt;
            </div>
          </div>
        </section>

        <!-- 10) EXPECTED COURSE -->
        <section id="course">
          <div class="kicker">Section 10</div>
          <h2>10) ⏳ Expected course & prognosis</h2>

          <h3>Typical timeline</h3>
          <ul class="clean">
            <li>Many children improve over <b>weeks</b> with consistent routines and skills.</li>
            <li>Some children have flares for <b>months</b>—especially during stress or constipation relapse.</li>
            <li>Most children do very well long-term with a plan.</li>
          </ul>

          <h3>What “getting better” looks like</h3>
          <ul class="clean">
            <li>Pain episodes are less frequent or shorter</li>
            <li>Child returns to school/activities even if mild pain remains</li>
            <li>Better sleep, better appetite, less fear about pain</li>
          </ul>

          <h3>What “getting worse” looks like</h3>
          <ul class="clean">
            <li>Increasing severity or frequency, new red flags</li>
            <li>More missed school and increasing avoidance</li>
            <li>Weight loss or persistent vomiting</li>
          </ul>

          <h3>Return to school/daycare/sports</h3>
          <ul class="clean">
            <li>🏫 Return as soon as safely possible; aim for <b>partial attendance</b> if needed.</li>
            <li>⚽ Gentle activity helps; avoid total rest unless clinician advises otherwise.</li>
            <li>🧠 Key idea: “We don’t wait for 0 pain to restart life; we restart life to help pain settle.”</li>
          </ul>
        </section>

        <!-- 11) COMPLICATIONS -->
        <section id="complications">
          <div class="kicker">Section 11</div>
          <h2>11) 🧯 Complications (brief but clear)</h2>
          <h3>Common complications</h3>
          <ul class="clean">
            <li>🏫 School avoidance and reduced activities</li>
            <li>😟 Anxiety around eating or leaving home</li>
            <li>🚽 Constipation cycles that worsen pain</li>
          </ul>

          <h3>Rare serious complications (red-flag reminder)</h3>
          <ul class="clean">
            <li>Functional pain itself is not dangerous, but <b>new red flags</b> require reassessment (blood, weight loss, severe vomiting, persistent fever).</li>
          </ul>
        </section>

        <!-- 12) PREVENTION -->
        <section id="prevention">
          <div class="kicker">Section 12</div>
          <h2>12) 🛡️ Prevention and reducing future episodes</h2>

          <h3>Lifestyle/environment prevention</h3>
          <ul class="clean">
            <li>Regular meals (especially breakfast)</li>
            <li>Daily movement</li>
            <li>Consistent sleep schedule</li>
            <li>Constipation prevention plan (hydration, fiber, toilet routine)</li>
          </ul>

          <h3>Hygiene and exposure reduction (when relevant)</h3>
          <ul class="clean">
            <li>Handwashing reduces stomach bugs that can trigger post-infectious pain.</li>
          </ul>

          <h3>Vaccines (if relevant)</h3>
          <ul class="clean">
            <li>Keeping routine immunizations up to date helps reduce infections that can upset the gut.</li>
          </ul>

          <h3>Recurrence prevention plan</h3>
          <ul class="clean">
            <li>Use the symptom diary during early flare signs</li>
            <li>Early constipation support (don’t wait for severe stool buildup)</li>
            <li>Practice calm skills daily (not only during pain)</li>
          </ul>
        </section>

        <!-- 13) SPECIAL SITUATIONS -->
        <section id="special">
          <div class="kicker">Section 13</div>
          <h2>13) 🧩 Special situations</h2>

          <h3>👶 Infants</h3>
          <ul class="clean">
            <li>Persistent crying, feeding difficulty, or poor growth needs clinician assessment to rule out feeding issues, reflux, allergy, or infection.</li>
          </ul>

          <h3>🧑‍🎓 Teens</h3>
          <ul class="clean">
            <li>Sleep, stress, and eating patterns often drive symptoms.</li>
            <li>CBT and gut–brain strategies can be especially effective.</li>
            <li>Ask about private time during visits—teens may share different symptoms privately.</li>
          </ul>

          <h3>🩺 Kids with chronic conditions (asthma, diabetes, immunosuppression)</h3>
          <ul class="clean">
            <li>Lower threshold to assess for infection, medication side effects, or dehydration.</li>
            <li>Keep care teams informed; don’t assume all pain is “functional.”</li>
          </ul>

          <h3>🧠 Neurodevelopmental differences/autism (practical adaptations)</h3>
          <ul class="clean">
            <li>Use visual schedules (meal/toilet/sleep routines).</li>
            <li>Track behavior changes: pacing, guarding belly, sleep change, new aggression may signal pain.</li>
            <li>Keep diet changes minimal and supervised to avoid nutritional gaps.</li>
          </ul>

          <h3>✈️ Travel considerations</h3>
          <ul class="clean">
            <li>Bring familiar snacks and hydration options.</li>
            <li>Plan toilet breaks and keep constipation prevention consistent.</li>
            <li>Know local urgent-care locations at destination.</li>
          </ul>

          <h3>🏫 School/daycare notes (what teachers should know)</h3>
          <ul class="clean">
            <li>Child may need brief bathroom access, water bottle, and a short calm break.</li>
            <li>Avoid repeated early pickups unless red flags are present—support attendance.</li>
          </ul>
        </section>

        <!-- 14) FOLLOW-UP -->
        <section id="followup">
          <div class="kicker">Section 14</div>
          <h2>14) 📞 Follow-up plan</h2>

          <h3>When to follow up and with whom</h3>
          <ul class="clean">
            <li>Start with family doctor/pediatrician for evaluation and initial plan.</li>
            <li>Follow up in <b>2–6 weeks</b> to adjust constipation plan, routines, and symptom supports.</li>
            <li>Referral to pediatric gastroenterology if red flags, poor growth, or persistent impact despite first-line care.</li>
          </ul>

          <h3>What would trigger earlier follow-up</h3>
          <ul class="clean">
            <li>Any new red flags (blood, weight loss, repeated vomiting, fever)</li>
            <li>Rapid worsening pain or significant functional decline</li>
          </ul>

          <h3>What to bring to the appointment</h3>
          <ul class="clean">
            <li>📝 Symptom diary (timing, stool, triggers, sleep)</li>
            <li>📸 Photos if stool or rash changes are relevant</li>
            <li>💊 List of all medicines/supplements tried and what happened</li>
          </ul>
        </section>

        <!-- 15) PARENT FAQS -->
        <section id="faq">
          <div class="kicker">Section 15</div>
          <h2>15) ❓ Parent FAQs</h2>

          <details>
            <summary>“Is it contagious?”</summary>
            <p>
              Functional abdominal pain itself is <b>not contagious</b>. If your child’s pain started after a stomach bug,
              the infection might have been contagious at the time, but the lingering sensitivity is not.
            </p>
          </details>

          <details>
            <summary>“Can my child eat ___?”</summary>
            <p>
              Most kids do best with a <b>balanced, regular diet</b>. If you suspect a trigger (like lactose),
              try a <b>short, supervised trial</b> and keep a diary. Avoid long-term restrictive diets without clinician/dietitian advice.
            </p>
          </details>

          <details>
            <summary>“Can they bathe/swim/exercise?”</summary>
            <p>
              Usually yes. Gentle activity often helps the gut settle. If pain is severe or there are red flags (fever, vomiting, dehydration),
              rest and seek medical care. For mild pain, movement and routine are beneficial.
            </p>
          </details>

          <details>
            <summary>“Will they outgrow it?”</summary>
            <p>
              Many children improve greatly over time, especially when they learn coping skills and keep routines.
              Some may have occasional flares during stress or constipation—but most can live normal, active lives.
            </p>
          </details>

          <details>
            <summary>“When can we stop treatment?”</summary>
            <p>
              When symptoms are stable and daily functioning is back to normal. Typically, you stop gradually:
              keep the routine first, then reduce supportive treatments under clinician guidance (especially constipation medicines).
            </p>
          </details>
        </section>

        <!-- 16) PRINTABLE TOOLS -->
        <section id="printables">
          <div class="kicker">Section 16</div>
          <h2>16) 🖨️ Printable tools (high-value add-ons)</h2>
          <p class="muted">Tip: click <b>Print / Save as PDF</b> at the top to save these pages for your fridge or school binder.</p>

          <div class="printables">
            <!-- One-page action plan -->
            <div class="printblock">
              <h3>✅ One-page action plan</h3>
              <div class="hint">Print-ready. Fill in blanks with your child’s info.</div>
              <div class="fill"><b>Child’s name:</b> ____________________________________</div>
              <div class="fill"><b>Typical pain pattern:</b> ______________________________</div>
              <div class="fill"><b>What helps most:</b> (heat / breathing / toilet routine / other) ____________________________________</div>
              <div class="fill"><b>Daily routine goals:</b> Breakfast ✅ • Toilet sit ✅ • Water bottle ✅ • School ✅ • Sleep ✅</div>
              <div class="fill"><b>Clinician contact:</b> ___________________  <b>Phone:</b> ___________________</div>
              <div class="fill"><b>Emergency red flags:</b> green vomiting • blood in stool • severe one-sided pain • dehydration • very sleepy</div>
            </div>

            <!-- Medication schedule box -->
            <div class="printblock">
              <h3>💊 Medication schedule box</h3>
              <div class="hint">Use “as prescribed” and write instructions from your clinician/pharmacist.</div>
              <table>
                <thead>
                  <tr><th>Medicine</th><th>When</th><th>How</th><th>Notes</th></tr>
                </thead>
                <tbody>
                  <tr><td>________________</td><td>AM / Noon / PM</td><td>With food? Y/N</td><td>______________</td></tr>
                  <tr><td>________________</td><td>AM / Noon / PM</td><td>With water</td><td>______________</td></tr>
                  <tr><td>________________</td><td>As needed</td><td>Max per day: ____</td><td>______________</td></tr>
                </tbody>
              </table>
            </div>

            <!-- Symptom diary -->
            <div class="printblock">
              <h3>📝 Symptom diary / tracker (1 week)</h3>
              <div class="hint">Circle pain score, note stool + triggers.</div>
              <table>
                <thead>
                  <tr><th>Day</th><th>Pain (0–10)</th><th>Meals/Skipped?</th><th>Stool</th><th>Sleep</th><th>Stress/Notes</th></tr>
                </thead>
                <tbody>
                  <tr><td>Mon</td><td>0 1 2 3 4 5 6 7 8 9 10</td><td>✅ / ❌</td><td>________</td><td>____ hrs</td><td>________</td></tr>
                  <tr><td>Tue</td><td>0 1 2 3 4 5 6 7 8 9 10</td><td>✅ / ❌</td><td>________</td><td>____ hrs</td><td>________</td></tr>
                  <tr><td>Wed</td><td>0 1 2 3 4 5 6 7 8 9 10</td><td>✅ / ❌</td><td>________</td><td>____ hrs</td><td>________</td></tr>
                  <tr><td>Thu</td><td>0 1 2 3 4 5 6 7 8 9 10</td><td>✅ / ❌</td><td>________</td><td>____ hrs</td><td>________</td></tr>
                  <tr><td>Fri</td><td>0 1 2 3 4 5 6 7 8 9 10</td><td>✅ / ❌</td><td>________</td><td>____ hrs</td><td>________</td></tr>
                  <tr><td>Sat</td><td>0 1 2 3 4 5 6 7 8 9 10</td><td>✅ / ❌</td><td>________</td><td>____ hrs</td><td>________</td></tr>
                  <tr><td>Sun</td><td>0 1 2 3 4 5 6 7 8 9 10</td><td>✅ / ❌</td><td>________</td><td>____ hrs</td><td>________</td></tr>
                </tbody>
              </table>
            </div>

            <!-- Red flags fridge sheet -->
            <div class="printblock">
              <h3>🚨 “Red flags” fridge sheet</h3>
              <div class="hint">If any of these happen, seek urgent care.</div>
              <ul class="clean">
                <li>🔴 Green (bilious) vomiting or repeated vomiting</li>
                <li>🔴 Blood in stool or black/tarry stool</li>
                <li>🔴 Severe one-sided belly pain (especially right lower belly)</li>
                <li>🔴 High fever + belly pain, very sleepy/hard to wake</li>
                <li>🔴 Dehydration (no urine, no tears, very dry mouth)</li>
                <li>🔴 Weight loss, persistent nighttime waking from pain</li>
              </ul>
              <div class="fill"><b>Nearest urgent care / ER:</b> ______________________________</div>
              <div class="fill"><b>Family doctor / clinic phone:</b> __________________________</div>
            </div>

            <!-- School/daycare instructions -->
            <div class="printblock">
              <h3>🏫 School/daycare instructions page</h3>
              <div class="hint">Give to teacher/school staff.</div>
              <p><b>Student:</b> ______________________  <b>Date:</b> ______________________</p>
              <p>
                This child has recurrent functional abdominal pain (gut–brain pain). They may occasionally report belly pain but usually look well.
                The goal is to <b>support attendance</b> and allow brief supports.
              </p>
              <ul class="clean">
                <li>✅ Allow water bottle access and bathroom breaks</li>
                <li>✅ Permit a short calm break (5–10 minutes) if pain rises</li>
                <li>✅ Encourage return to class once settled</li>
                <li>📞 Call parents only if: vomiting, fever, severe worsening pain, or child appears unwell</li>
              </ul>
              <div class="fill"><b>Parent/guardian contact:</b> ______________________________</div>
            </div>
          </div>
        </section>

        <!-- 17) SOURCES + UPDATED -->
        <section id="sources">
          <div class="kicker">Section 17</div>
          <h2>17) 📚 Credible sources + last updated date</h2>
          <ul class="clean">
            <li>North American Society for Pediatric Gastroenterology, Hepatology and Nutrition (NASPGHAN) — parent resources on functional GI disorders</li>
            <li>Rome Foundation — functional gastrointestinal disorders (Rome criteria overview)</li>
            <li>American Academy of Pediatrics (AAP) — guidance on chronic abdominal pain and functional disorders</li>
            <li>Children’s hospital patient education pages (for example: major pediatric centers’ abdominal pain / IBS resources)</li>
            <li>National Institute of Diabetes and Digestive and Kidney Diseases (NIDDK) — abdominal pain and functional GI information</li>
          </ul>
          <p class="muted"><b>Last reviewed/updated on:</b> 2025-12-27</p>
          <p class="muted">Local guidance may differ depending on your region, your child’s age, and their medical history.</p>
        </section>

        <!-- 18) SAFETY DISCLAIMER -->
        <section id="disclaimer">
          <div class="kicker">Section 18</div>
          <h2>18) 🧡 Safety disclaimer (short, not scary)</h2>
          <p>
            This guide supports—not replaces—medical advice. If you’re worried, trust your instincts and seek urgent care,
            especially if any red flags are present.
          </p>
        </section>

        <!-- REQUIRED END-OF-POST CREDENTIAL BOX -->
        <section class="credential" aria-label="Credential box">
          <pre>This guide was fully developed &amp; reviewed by
Dr. Mohammad Hussein, MD, FRCPC
ROYAL COLLEGE–CERTIFIED PEDIATRICIAN &amp; PEDIATRIC GASTROENTEROLOGIST
Board-certified pediatrician and pediatric gastroenterologist (Royal College of Physicians and
Surgeons of Canada) with expertise in inflammatory bowel disease, eosinophilic gastrointestinal
disorders, motility and functional testing, and complex nutrition across diverse international
practice settings.
To book an online assessment
Email Dr. Hussein’s Assistant Elizabeth Gray at:
Elizabeth.Gray@pedsgimind.ca
In the email subject, please write:
New Assessment Appointment with Dr. Hussein
Important: This appointment is completely online as Dr. Hussein is currently working overseas.
This service is not covered by OHIP</pre>
        </section>

      </main>

      <!-- SIDEBAR -->
      <aside class="card">
        <div class="kicker">Parent toolkit</div>
        <h2>🧰 Quick tools</h2>

        <div class="callout blue">
          <h4>📝 Start here (2 minutes)</h4>
          <ol style="margin:0; padding-left:18px">
            <li>Check red flags</li>
            <li>Begin the 1-week diary</li>
            <li>Pick 1 calming skill to practice daily</li>
          </ol>
        </div>

        <div class="callout green">
          <h4>🧘 60-second belly breathing</h4>
          <p class="muted" style="margin-top:0">
            Place one hand on belly. Breathe in through nose 4 seconds (belly rises), breathe out 6 seconds (belly falls). Repeat 5 times.
          </p>
          <div class="checklist">
            <label><input type="checkbox"> ✅ Did 5 breaths</label>
            <label><input type="checkbox"> ✅ Tried warm pack</label>
            <label><input type="checkbox"> ✅ Took a short walk</label>
          </div>
        </div>

        <div class="callout yellow">
          <h4>🍽️ Meal tips</h4>
          <ul class="clean">
            <li>Don’t skip breakfast</li>
            <li>Smaller meals can help</li>
            <li>Limit carbonated drinks if they worsen symptoms</li>
          </ul>
        </div>

        <div class="figure">
          <h3>🖼️ Supportive visual placeholder</h3>
          <div class="imgph small">🧒 Calm Corner Visual Placeholder</div>
          <!-- AI IMAGE PROMPT: Create a friendly illustration of a child using a “calm corner” (blanket, breathing card, water bottle, warm pack) with parent nearby. Soft colors, reassuring, not scary. -->
          <div class="ai-prompt">
            <b><!-- AI IMAGE PROMPT:</b> Illustration: “Calm Corner for Belly Pain.” Child sitting comfortably with warm pack on tummy, breathing card, water bottle, parent supportive. Soft pastel colors, minimal medical cues, friendly home environment. --&gt;
          </div>
        </div>

        <div class="callout red">
          <h4>🚨 Red flags (quick reminder)</h4>
          <p style="margin:0" class="muted">Green vomiting • blood in stool • severe one-sided pain • dehydration • very sleepy • weight loss</p>
        </div>

        <button class="btn" style="width:100%; margin-top:10px" onclick="window.scrollTo({top:0, behavior:'smooth'})">⬆️ Back to top</button>
      </aside>
    </div>
  </div>

  <script>
    // Minimal JS: helpful “copy diary” button could be added later.
    // For now, keep JS minimal as requested.
  </script>
</body>
</html>
