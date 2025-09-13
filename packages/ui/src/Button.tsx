export const Button = ({ children, onClick, variant = 'primary' }) => {
  const base = 'px-4 py-2 rounded font-medium';
  const classes = variant === 'primary'
    ? 'bg-pink-500 text-white hover:bg-pink-600'
    : 'border border-gray-300 hover:bg-gray-50';
  return <button className={`${base} ${classes}`} onClick={onClick}>{children}</button>;
};