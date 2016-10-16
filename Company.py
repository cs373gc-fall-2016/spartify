class Company(db.Model)
  name = db.Column(db.String(20), primary_key=True)
  description = db.Column(db.String(120), unique=True)

  def __init__(self, name, description):
    self.name = name
    self.description = description

  def __repr__(self):
    return '<Company %r>' % self.name
