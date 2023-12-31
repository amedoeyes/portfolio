import type { Metadata } from "next";
import "./globals.css";

export const metadata: Metadata = {
	title: "Ahmed AbouEleyoun",
	description: "A passionate software engineer who loves computers.",
};

export default function RootLayout({
	children,
}: {
	children: React.ReactNode;
}) {
	return (
		<html lang="en" className="scroll-smooth">
			<body className="bg-secondary font-mono text-primary">
				{children}
			</body>
		</html>
	);
}
