require 'spec_helper'

describe Task do
  subject { build(:task) }
  it { should be_valid }

  it "returns all incomplete tasks" do
    task1 = create(:task)
    task2 = create(:completed_task)

    incomplete_tasks = Task.incomplete
    expect(incomplete_tasks.length).to eq(1)
  end

end
