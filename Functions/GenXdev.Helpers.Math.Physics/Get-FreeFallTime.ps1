﻿###############################################################################
<#
.SYNOPSIS
Calculates the time it takes for an object to fall a specified distance.

.DESCRIPTION
This function calculates the time it takes for an object to fall from a given
height, taking into account terminal velocity due to air resistance. It uses a
numerical method with small time steps for accurate calculation.

.PARAMETER HeightInMeters
The initial height of the falling object in meters.

.PARAMETER TerminalVelocityInMs
The terminal velocity of the falling object in meters per second. Default value
is 53 m/s, which is the approximate terminal velocity of a human in free fall.

.EXAMPLE
Get-FreeFallTime -HeightInMeters 100
Returns the time in seconds for an object to fall 100 meters with default
terminal velocity

.EXAMPLE
Get-FreeFallTime 500 45
Returns the time in seconds for an object to fall 500 meters with a terminal
velocity of 45 m/s
#>
function Get-FreeFallTime {

    [OutputType([double], [int])]
    [CmdletBinding()]
    param (
        ########################################################################
        [parameter(
            Position = 0,
            Mandatory = $true,
            HelpMessage = 'The initial height of the falling object in meters'
        )]
        [double]$HeightInMeters,
        ########################################################################
        [parameter(
            Position = 1,
            Mandatory = $false,
            HelpMessage = 'The terminal velocity of the falling object in m/s'
        )]
        [double]$TerminalVelocityInMs = 53  # Default human terminal velocity in m/s
        ########################################################################
    )

    begin {

        # define the acceleration due to gravity in m/s^2
        [double] $gravity = 9.81

        # set up time step for numerical calculation in seconds
        [double] $dt = 0.01  # Time step in seconds

        # initialize variables for the simulation
        [double] $height = $HeightInMeters
        [double] $velocity = 0
        [double] $time = 0

        Microsoft.PowerShell.Utility\Write-Verbose (
            "Calculating free fall time from height: $HeightInMeters m with " +
            "terminal velocity: $TerminalVelocityInMs m/s"
        )
    }

    process {

        # simulate the fall until the object reaches the ground
        while ($height -gt 0) {

            # apply simplified air resistance model by capping at terminal velocity
            if ($velocity -ge $TerminalVelocityInMs) {
                $velocity = $TerminalVelocityInMs
            }
            else {
                # increase velocity due to gravity
                $velocity += $gravity * $dt
            }

            # update height based on current velocity
            $height -= $velocity * $dt

            # increment time counter
            $time += $dt

            # add safety check to prevent infinite loops
            if ($time -gt 1000) {
                Microsoft.PowerShell.Utility\Write-Error 'Calculation timeout'
                return 0
            }
        }

        Microsoft.PowerShell.Utility\Write-Verbose "Free fall completed in $time seconds"
    }

    end {

        # round the result to 2 decimal places for readability
        return [Math]::Round($time, 2d)
    }
}
