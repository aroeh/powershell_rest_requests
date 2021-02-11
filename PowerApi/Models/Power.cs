using System.Collections.Generic;

namespace PowerApi.Models
{
    public class Power
    {
        public int Id { get; set; }
        
        public List<Ability> Abilities { get; set; }

        public List<Weakness> Weaknesses { get; set; }
    }
}