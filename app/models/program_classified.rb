# frozen_string_literal: true

class ProgramClassified < ApplicationRecord
  belongs_to :program
  belongs_to :classified
end
