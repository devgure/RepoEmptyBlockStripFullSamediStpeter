# ai-training/train_matching_model.py
import pandas as pd
from sklearn.ensemble import RandomForestClassifier
from sklearn.model_selection import train_test_split
import joblib

# Load dataset
df = pd.read_csv('ai-training/dataset/profiles.csv')

# Features
X = df[['age_diff', 'common_interests', 'distance_km', 'bio_similarity']]
y = df['matched']  # 1 if matched, 0 otherwise

X_train, X_test, y_train, y_test = train_test_split(X, y, test_size=0.2)

# Train model
model = RandomForestClassifier()
model.fit(X_train, y_train)

# Save model
joblib.dump(model, 'services/ai-service/model/matching_model.pkl')
print("✅ Model trained and saved!")