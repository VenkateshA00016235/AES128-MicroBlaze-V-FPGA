#include "timer_utils.h"
#include "xil_io.h"

#define AXI_TIMER_BASEADDR 0x41C00000U

#define TCSR0_OFFSET 0x00U
#define TLR0_OFFSET  0x04U
#define TCR0_OFFSET  0x08U

#define TCSR_ENT0  0x00000080U
#define TCSR_LOAD0 0x00000020U
#define TCSR_UDT0  0x00000002U

void timer_start(void)
{
    /* Stop timer */
    Xil_Out32(AXI_TIMER_BASEADDR + TCSR0_OFFSET, 0U);

    /* Load zero */
    Xil_Out32(AXI_TIMER_BASEADDR + TLR0_OFFSET, 0U);
    Xil_Out32(
        AXI_TIMER_BASEADDR + TCSR0_OFFSET,
        TCSR_LOAD0
    );

    /* Start counting upward */
    Xil_Out32(
        AXI_TIMER_BASEADDR + TCSR0_OFFSET,
        TCSR_ENT0
    );
}

uint32_t timer_stop(void)
{
    uint32_t count;

    count = Xil_In32(
        AXI_TIMER_BASEADDR + TCR0_OFFSET
    );

    Xil_Out32(
        AXI_TIMER_BASEADDR + TCSR0_OFFSET,
        0U
    );

    return count;
}