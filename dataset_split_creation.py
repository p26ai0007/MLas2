import numpy as np
from sklearn.datasets import fetch_olivetti_faces
from sklearn.model_selection import train_test_split

seed = 260007  # Roll No. P26AI0007

faces = fetch_olivetti_faces(shuffle=False)
X = faces.images
y = faces.target
indices = np.arange(len(y))

# 60% Train (6 per identity), 40% Temp (4 per identity)
train_idx, temp_idx, y_train, y_temp = train_test_split(
    indices,
    y,
    train_size=0.6,
    stratify=y,
    random_state=seed
)

# Split Temp equally into Val (2 per identity) and Test (2 per identity)
val_idx, test_idx, y_val, y_test = train_test_split(
    temp_idx,
    y_temp,
    test_size=0.5,
    stratify=y_temp,
    random_state=seed
)

X_train, X_val, X_test = X[train_idx], X[val_idx], X[test_idx]

np.savez("olivetti_split_indices.npz", train=train_idx, val=val_idx, test=test_idx)

print(f"Train: {X_train.shape} | Val: {X_val.shape} | Test: {X_test.shape}")