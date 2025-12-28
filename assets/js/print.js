function printSection(id){
  const el = document.getElementById(id);
  if (el) el.scrollIntoView({behavior: "instant", block: "start"});
  window.print();
}
