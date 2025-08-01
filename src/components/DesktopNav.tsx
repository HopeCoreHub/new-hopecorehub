import { useNavigate, useLocation } from "react-router-dom";
import { Button } from "@/components/ui/button";
import { Home, MessageCircle, Bot, Heart, Settings, Sun, Moon, User } from "lucide-react";
import { useTheme } from "next-themes";
import { useAuth } from "@/hooks/useAuth";

const DesktopNav = () => {
  const navigate = useNavigate();
  const location = useLocation();
  const { theme, setTheme } = useTheme();
  const { user, isGuest, signOut } = useAuth();

  const navItems = [
    { path: "/", icon: Home, label: "Home" },
    { path: "/forum", icon: MessageCircle, label: "Forum" },
    { path: "/mahoro", icon: Bot, label: "Mahoro AI" },
    { path: "/muganga", icon: Heart, label: "Muganga" },
  ];

  const handleProfileClick = () => {
    if (user || isGuest) {
      navigate("/profile");
    } else {
      navigate("/welcome");
    }
  };

  return (
    <nav className="hidden md:flex fixed top-0 left-0 right-0 bg-background/80 backdrop-blur-md border-b border-border z-50 px-6 py-4">
      <div className="container mx-auto flex items-center justify-between">
        {/* Logo */}
        <div className="flex items-center space-x-2">
          <Heart className="w-8 h-8 text-primary fill-primary" />
          <span className="text-xl font-bold text-foreground">HopeCore Hub</span>
        </div>

        {/* Navigation Links */}
        <div className="flex items-center space-x-1">
          {navItems.map(({ path, icon: Icon, label }) => {
            const isActive = location.pathname === path;
            return (
              <Button
                key={path}
                variant={isActive ? "default" : "ghost"}
                onClick={() => navigate(path)}
                className="flex items-center space-x-2 h-10"
              >
                <Icon className="w-4 h-4" />
                <span className="hidden lg:inline">{label}</span>
              </Button>
            );
          })}
        </div>

        {/* Right Side Actions */}
        <div className="flex items-center space-x-2">
          <Button
            variant="ghost"
            size="icon"
            onClick={() => setTheme(theme === "dark" ? "light" : "dark")}
          >
            {theme === "dark" ? <Sun className="w-4 h-4" /> : <Moon className="w-4 h-4" />}
          </Button>
          
          <Button
            variant="ghost"
            onClick={handleProfileClick}
            className="flex items-center space-x-2"
          >
            <User className="w-4 h-4" />
            <span className="hidden lg:inline">
              {user ? "Profile" : isGuest ? "Guest" : "Sign In"}
            </span>
          </Button>

          <Button
            variant="ghost"
            onClick={() => navigate("/settings")}
            className="flex items-center space-x-2"
          >
            <Settings className="w-4 h-4" />
            <span className="hidden lg:inline">Settings</span>
          </Button>

          {user && (
            <Button
              variant="outline"
              onClick={signOut}
              className="hidden lg:inline-flex"
            >
              Sign Out
            </Button>
          )}
        </div>
      </div>
    </nav>
  );
};

export default DesktopNav;