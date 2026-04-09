import type { Metadata } from "next";
import "./globals.css";

export const metadata: Metadata = {
  title: "__PROJECT_NAME__",
  description: "__PROJECT_DESC__",
};

export default function RootLayout({
  children,
}: Readonly<{
  children: React.ReactNode;
}>) {
  return (
    <html lang="fr">
      <body className="flex min-h-svh flex-col antialiased">
        {children}
      </body>
    </html>
  );
}
