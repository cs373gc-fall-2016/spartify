class Contributor(db.Model)
  username = db.Column(db.String(20), primary_key=True)
  email = db.Column(db.String(120), unique=True)

  def __init__(self, username, email):
    self.username = username
    self.email=email

  def __repr__(self):
    return '<Contributor %r>' % self.username
