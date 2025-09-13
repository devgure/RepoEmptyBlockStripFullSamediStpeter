export const ProfileCard = ({ user, onLike, onSkip }) => (
  <div className="bg-white rounded-xl shadow-lg overflow-hidden">
    <img src={user.photos[0]?.url} className="w-full h-80 object-cover" />
    <div className="p-4">
      <h3 className="text-xl font-bold">{user.name}, {user.age}</h3>
      <p className="text-gray-600">{user.bio}</p>
      <div className="flex gap-2 mt-4">
        <Button variant="outline" onClick={onSkip}>Skip</Button>
        <Button onClick={onLike}>Like</Button>
      </div>
    </div>
  </div>
);