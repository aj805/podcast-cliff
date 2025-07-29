"""
Revision ID: add_slack_github_installs_table
Revises: 
Create Date: 2023-10-08

"""

from alembic import op
import sqlalchemy as sa

# revision identifiers, used by Alembic.
revision = 'add_slack_github_installs_table'
down_revision = None
branch_labels = None
depends_on = None

def upgrade():
    op.create_table(
        'slack_github_installs',
        sa.Column('id', sa.Integer, primary_key=True),
        sa.Column('slack_team_id', sa.String(length=255), nullable=False),
        sa.Column('github_installation_id', sa.Integer, nullable=False),
        sa.Column('created_at', sa.DateTime, server_default=sa.func.now()),
    )

def downgrade():
    op.drop_table('slack_github_installs')
