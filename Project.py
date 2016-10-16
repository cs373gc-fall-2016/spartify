class Project(db.Model)
  name = db.Column(db.String(20), primary_key=True)
  createdDate = db.Column(db.DateTime(), unique=True)

  def __init__(self, name, createdDate):
    self.name = name
    self.createdDate = createdDate

  def __repr__(self):
    return '<Project %r>' % self.name
