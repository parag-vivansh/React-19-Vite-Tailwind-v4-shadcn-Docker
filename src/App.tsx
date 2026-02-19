import { Button } from "@/components/ui/button";
import { useEffect, useState } from "react";

function App() {
  const [isDark, setIsDark] = useState(false);

  useEffect(() => {
    if (isDark) {
      document.documentElement.classList.add("dark");
    } else {
      document.documentElement.classList.remove("dark");
    }
  }, [isDark]);

  return (
    <div className="min-h-screen flex items-center justify-center bg-background transition-colors duration-300">
      <div className="flex flex-col items-center gap-6 p-10 bg-card rounded-2xl shadow-lg border border-border transition-colors duration-300">
        <h1 className="text-2xl font-semibold text-foreground">
          React 19 + Vite + Tailwind v4 + shadcn 🚀 + TS + Docker
        </h1>


        <Button
          variant="secondary"
          onClick={() => setIsDark(!isDark)}
        >
          Toggle {isDark ? "Light" : "Dark"} Mode
        </Button>
      </div>
    </div>
  );
}

export default App;
