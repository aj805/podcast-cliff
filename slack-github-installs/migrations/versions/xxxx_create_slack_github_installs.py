"""
Revision ID: xxxx_create_slack_github_installs
Revises: 
Create Date: 2023-10-05

"""

from alembic import op
import sqlalchemy as sa

# revision identifiers, used by Alembic.
revision = 'xxxx_create_slack_github_installs'
down_revision = None
branch_labels = None
depends_on = None

def upgrade():
    op.create_table(
        'slack_github_installs',
        sa.Column('id', sa.Integer, primary_key=True),
        sa.Column('user_id', sa.String(length=50), nullable=False),
        sa.Column('repository', sa.String(length=100), nullable=False),
        sa.Column('installed_at', sa.DateTime, nullable=False)
    )

def downgrade():
    op.drop_table('slack_github_installs')
