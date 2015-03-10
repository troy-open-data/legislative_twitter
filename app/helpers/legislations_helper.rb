module LegislationsHelper
  # Prints the changes between a given version and the previous one in the
  # format: "Changed attr1, attr2, attr3 (time changed)"
  def diff_summary(version)
    "Changed #{version.changeset.keys.join(", ")} (#{version.created_at.strftime("%l:%M%P on %m/%d/%Y")})"
  end
end
