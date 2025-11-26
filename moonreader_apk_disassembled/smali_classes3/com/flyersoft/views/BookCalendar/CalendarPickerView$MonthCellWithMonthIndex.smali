.class Lcom/flyersoft/views/BookCalendar/CalendarPickerView$MonthCellWithMonthIndex;
.super Ljava/lang/Object;
.source "CalendarPickerView.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/flyersoft/views/BookCalendar/CalendarPickerView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "MonthCellWithMonthIndex"
.end annotation


# instance fields
.field cell:Lcom/flyersoft/views/BookCalendar/MonthCellDescriptor;

.field monthIndex:I


# direct methods
.method constructor <init>(Lcom/flyersoft/views/BookCalendar/MonthCellDescriptor;I)V
    .locals 0

    .line 851
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 852
    iput-object p1, p0, Lcom/flyersoft/views/BookCalendar/CalendarPickerView$MonthCellWithMonthIndex;->cell:Lcom/flyersoft/views/BookCalendar/MonthCellDescriptor;

    .line 853
    iput p2, p0, Lcom/flyersoft/views/BookCalendar/CalendarPickerView$MonthCellWithMonthIndex;->monthIndex:I

    return-void
.end method
