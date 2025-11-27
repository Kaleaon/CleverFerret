.class public final enum Lcom/flyersoft/views/BookCalendar/CalendarPickerView$SelectionMode;
.super Ljava/lang/Enum;
.source "CalendarPickerView.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/flyersoft/views/BookCalendar/CalendarPickerView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "SelectionMode"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/flyersoft/views/BookCalendar/CalendarPickerView$SelectionMode;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/flyersoft/views/BookCalendar/CalendarPickerView$SelectionMode;

.field public static final enum MULTIPLE:Lcom/flyersoft/views/BookCalendar/CalendarPickerView$SelectionMode;

.field public static final enum RANGE:Lcom/flyersoft/views/BookCalendar/CalendarPickerView$SelectionMode;

.field public static final enum SINGLE:Lcom/flyersoft/views/BookCalendar/CalendarPickerView$SelectionMode;


# direct methods
.method private static synthetic $values()[Lcom/flyersoft/views/BookCalendar/CalendarPickerView$SelectionMode;
    .locals 3

    const/4 v0, 0x3

    .line 54
    new-array v0, v0, [Lcom/flyersoft/views/BookCalendar/CalendarPickerView$SelectionMode;

    sget-object v1, Lcom/flyersoft/views/BookCalendar/CalendarPickerView$SelectionMode;->SINGLE:Lcom/flyersoft/views/BookCalendar/CalendarPickerView$SelectionMode;

    const/4 v2, 0x0

    aput-object v1, v0, v2

    sget-object v1, Lcom/flyersoft/views/BookCalendar/CalendarPickerView$SelectionMode;->MULTIPLE:Lcom/flyersoft/views/BookCalendar/CalendarPickerView$SelectionMode;

    const/4 v2, 0x1

    aput-object v1, v0, v2

    sget-object v1, Lcom/flyersoft/views/BookCalendar/CalendarPickerView$SelectionMode;->RANGE:Lcom/flyersoft/views/BookCalendar/CalendarPickerView$SelectionMode;

    const/4 v2, 0x2

    aput-object v1, v0, v2

    return-object v0
.end method

.method static constructor <clinit>()V
    .locals 3

    .line 59
    new-instance v0, Lcom/flyersoft/views/BookCalendar/CalendarPickerView$SelectionMode;

    const-string v1, "SINGLE"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Lcom/flyersoft/views/BookCalendar/CalendarPickerView$SelectionMode;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/flyersoft/views/BookCalendar/CalendarPickerView$SelectionMode;->SINGLE:Lcom/flyersoft/views/BookCalendar/CalendarPickerView$SelectionMode;

    .line 61
    new-instance v0, Lcom/flyersoft/views/BookCalendar/CalendarPickerView$SelectionMode;

    const-string v1, "MULTIPLE"

    const/4 v2, 0x1

    invoke-direct {v0, v1, v2}, Lcom/flyersoft/views/BookCalendar/CalendarPickerView$SelectionMode;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/flyersoft/views/BookCalendar/CalendarPickerView$SelectionMode;->MULTIPLE:Lcom/flyersoft/views/BookCalendar/CalendarPickerView$SelectionMode;

    .line 69
    new-instance v0, Lcom/flyersoft/views/BookCalendar/CalendarPickerView$SelectionMode;

    const-string v1, "RANGE"

    const/4 v2, 0x2

    invoke-direct {v0, v1, v2}, Lcom/flyersoft/views/BookCalendar/CalendarPickerView$SelectionMode;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/flyersoft/views/BookCalendar/CalendarPickerView$SelectionMode;->RANGE:Lcom/flyersoft/views/BookCalendar/CalendarPickerView$SelectionMode;

    .line 54
    invoke-static {}, Lcom/flyersoft/views/BookCalendar/CalendarPickerView$SelectionMode;->$values()[Lcom/flyersoft/views/BookCalendar/CalendarPickerView$SelectionMode;

    move-result-object v0

    sput-object v0, Lcom/flyersoft/views/BookCalendar/CalendarPickerView$SelectionMode;->$VALUES:[Lcom/flyersoft/views/BookCalendar/CalendarPickerView$SelectionMode;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x1000,
            0x1000
        }
        names = {
            null,
            null
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 54
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/flyersoft/views/BookCalendar/CalendarPickerView$SelectionMode;
    .locals 1
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8000
        }
        names = {
            null
        }
    .end annotation

    .line 54
    const-class v0, Lcom/flyersoft/views/BookCalendar/CalendarPickerView$SelectionMode;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lcom/flyersoft/views/BookCalendar/CalendarPickerView$SelectionMode;

    return-object p0
.end method

.method public static values()[Lcom/flyersoft/views/BookCalendar/CalendarPickerView$SelectionMode;
    .locals 1

    .line 54
    sget-object v0, Lcom/flyersoft/views/BookCalendar/CalendarPickerView$SelectionMode;->$VALUES:[Lcom/flyersoft/views/BookCalendar/CalendarPickerView$SelectionMode;

    invoke-virtual {v0}, [Lcom/flyersoft/views/BookCalendar/CalendarPickerView$SelectionMode;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/flyersoft/views/BookCalendar/CalendarPickerView$SelectionMode;

    return-object v0
.end method
