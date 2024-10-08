        using System.Management.Automation;

        namespace GenXdev.Helpers
        {
            [Cmdlet(VerbsCommunications.Write, "Message")]
            public class YourExampleCmdletWriteMessage : Cmdlet
            {
                [Parameter(Position = 0, Mandatory = true)]
                public string Message { get; set; }

                protected override void ProcessRecord()
                {
                    WriteObject($"Your message: {Message}");
                }
            }
        }
