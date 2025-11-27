.class Lcom/flyersoft/views/BookCalendar/CalendarPickerView$DefaultOnInvalidDateSelectedListener;
.super Ljava/lang/Object;
.source "CalendarPickerView.java"

# interfaces
.implements Lcom/flyersoft/views/BookCalendar/CalendarPickerView$OnInvalidDateSelectedListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/flyersoft/views/BookCalendar/CalendarPickerView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "DefaultOnInvalidDateSelectedListener"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/flyersoft/views/BookCalendar/CalendarPickerView;


# direct methods
.method private constructor <init>(Lcom/flyersoft/views/BookCalendar/CalendarPickerView;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x1010
        }
        names = {
            null
        }
    .end annotation

    .line 1132
    iput-object p1, p0, Lcom/flyersoft/views/BookCalendar/CalendarPickerView$DefaultOnInvalidDateSelectedListener;->this$0:Lcom/flyersoft/views/BookCalendar/CalendarPickerView;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/flyersoft/views/BookCalendar/CalendarPickerView;Lcom/flyersoft/views/BookCalendar/CalendarPickerView-IA;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/flyersoft/views/BookCalendar/CalendarPickerView$DefaultOnInvalidDateSelectedListener;-><init>(Lcom/flyersoft/views/BookCalendar/CalendarPickerView;)V

    return-void
.end method


# virtual methods
.method public onInvalidDateSelected(Ljava/util/Date;)V
    .locals 0

    return-void
.end method
