.class public final enum Lcom/flyersoft/views/BookCalendar/RangeState;
.super Ljava/lang/Enum;
.source "RangeState.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/flyersoft/views/BookCalendar/RangeState;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/flyersoft/views/BookCalendar/RangeState;

.field public static final enum FIRST:Lcom/flyersoft/views/BookCalendar/RangeState;

.field public static final enum LAST:Lcom/flyersoft/views/BookCalendar/RangeState;

.field public static final enum MIDDLE:Lcom/flyersoft/views/BookCalendar/RangeState;

.field public static final enum NONE:Lcom/flyersoft/views/BookCalendar/RangeState;


# direct methods
.method private static synthetic $values()[Lcom/flyersoft/views/BookCalendar/RangeState;
    .locals 3

    const/4 v0, 0x4

    .line 4
    new-array v0, v0, [Lcom/flyersoft/views/BookCalendar/RangeState;

    sget-object v1, Lcom/flyersoft/views/BookCalendar/RangeState;->NONE:Lcom/flyersoft/views/BookCalendar/RangeState;

    const/4 v2, 0x0

    aput-object v1, v0, v2

    sget-object v1, Lcom/flyersoft/views/BookCalendar/RangeState;->FIRST:Lcom/flyersoft/views/BookCalendar/RangeState;

    const/4 v2, 0x1

    aput-object v1, v0, v2

    sget-object v1, Lcom/flyersoft/views/BookCalendar/RangeState;->MIDDLE:Lcom/flyersoft/views/BookCalendar/RangeState;

    const/4 v2, 0x2

    aput-object v1, v0, v2

    sget-object v1, Lcom/flyersoft/views/BookCalendar/RangeState;->LAST:Lcom/flyersoft/views/BookCalendar/RangeState;

    const/4 v2, 0x3

    aput-object v1, v0, v2

    return-object v0
.end method

.method static constructor <clinit>()V
    .locals 3

    .line 5
    new-instance v0, Lcom/flyersoft/views/BookCalendar/RangeState;

    const-string v1, "NONE"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Lcom/flyersoft/views/BookCalendar/RangeState;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/flyersoft/views/BookCalendar/RangeState;->NONE:Lcom/flyersoft/views/BookCalendar/RangeState;

    new-instance v0, Lcom/flyersoft/views/BookCalendar/RangeState;

    const-string v1, "FIRST"

    const/4 v2, 0x1

    invoke-direct {v0, v1, v2}, Lcom/flyersoft/views/BookCalendar/RangeState;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/flyersoft/views/BookCalendar/RangeState;->FIRST:Lcom/flyersoft/views/BookCalendar/RangeState;

    new-instance v0, Lcom/flyersoft/views/BookCalendar/RangeState;

    const-string v1, "MIDDLE"

    const/4 v2, 0x2

    invoke-direct {v0, v1, v2}, Lcom/flyersoft/views/BookCalendar/RangeState;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/flyersoft/views/BookCalendar/RangeState;->MIDDLE:Lcom/flyersoft/views/BookCalendar/RangeState;

    new-instance v0, Lcom/flyersoft/views/BookCalendar/RangeState;

    const-string v1, "LAST"

    const/4 v2, 0x3

    invoke-direct {v0, v1, v2}, Lcom/flyersoft/views/BookCalendar/RangeState;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/flyersoft/views/BookCalendar/RangeState;->LAST:Lcom/flyersoft/views/BookCalendar/RangeState;

    .line 4
    invoke-static {}, Lcom/flyersoft/views/BookCalendar/RangeState;->$values()[Lcom/flyersoft/views/BookCalendar/RangeState;

    move-result-object v0

    sput-object v0, Lcom/flyersoft/views/BookCalendar/RangeState;->$VALUES:[Lcom/flyersoft/views/BookCalendar/RangeState;

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

    .line 4
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/flyersoft/views/BookCalendar/RangeState;
    .locals 1
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8000
        }
        names = {
            null
        }
    .end annotation

    .line 4
    const-class v0, Lcom/flyersoft/views/BookCalendar/RangeState;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lcom/flyersoft/views/BookCalendar/RangeState;

    return-object p0
.end method

.method public static values()[Lcom/flyersoft/views/BookCalendar/RangeState;
    .locals 1

    .line 4
    sget-object v0, Lcom/flyersoft/views/BookCalendar/RangeState;->$VALUES:[Lcom/flyersoft/views/BookCalendar/RangeState;

    invoke-virtual {v0}, [Lcom/flyersoft/views/BookCalendar/RangeState;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/flyersoft/views/BookCalendar/RangeState;

    return-object v0
.end method
