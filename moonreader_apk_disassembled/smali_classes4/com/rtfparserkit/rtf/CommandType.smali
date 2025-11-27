.class public final enum Lcom/rtfparserkit/rtf/CommandType;
.super Ljava/lang/Enum;
.source "CommandType.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/rtfparserkit/rtf/CommandType;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/rtfparserkit/rtf/CommandType;

.field public static final enum Destination:Lcom/rtfparserkit/rtf/CommandType;

.field public static final enum Encoding:Lcom/rtfparserkit/rtf/CommandType;

.field public static final enum Flag:Lcom/rtfparserkit/rtf/CommandType;

.field public static final enum Symbol:Lcom/rtfparserkit/rtf/CommandType;

.field public static final enum Toggle:Lcom/rtfparserkit/rtf/CommandType;

.field public static final enum Value:Lcom/rtfparserkit/rtf/CommandType;


# direct methods
.method private static synthetic $values()[Lcom/rtfparserkit/rtf/CommandType;
    .locals 3

    const/4 v0, 0x6

    .line 22
    new-array v0, v0, [Lcom/rtfparserkit/rtf/CommandType;

    sget-object v1, Lcom/rtfparserkit/rtf/CommandType;->Symbol:Lcom/rtfparserkit/rtf/CommandType;

    const/4 v2, 0x0

    aput-object v1, v0, v2

    sget-object v1, Lcom/rtfparserkit/rtf/CommandType;->Flag:Lcom/rtfparserkit/rtf/CommandType;

    const/4 v2, 0x1

    aput-object v1, v0, v2

    sget-object v1, Lcom/rtfparserkit/rtf/CommandType;->Toggle:Lcom/rtfparserkit/rtf/CommandType;

    const/4 v2, 0x2

    aput-object v1, v0, v2

    sget-object v1, Lcom/rtfparserkit/rtf/CommandType;->Value:Lcom/rtfparserkit/rtf/CommandType;

    const/4 v2, 0x3

    aput-object v1, v0, v2

    sget-object v1, Lcom/rtfparserkit/rtf/CommandType;->Destination:Lcom/rtfparserkit/rtf/CommandType;

    const/4 v2, 0x4

    aput-object v1, v0, v2

    sget-object v1, Lcom/rtfparserkit/rtf/CommandType;->Encoding:Lcom/rtfparserkit/rtf/CommandType;

    const/4 v2, 0x5

    aput-object v1, v0, v2

    return-object v0
.end method

.method static constructor <clinit>()V
    .locals 3

    .line 24
    new-instance v0, Lcom/rtfparserkit/rtf/CommandType;

    const-string v1, "Symbol"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Lcom/rtfparserkit/rtf/CommandType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/rtfparserkit/rtf/CommandType;->Symbol:Lcom/rtfparserkit/rtf/CommandType;

    .line 25
    new-instance v0, Lcom/rtfparserkit/rtf/CommandType;

    const-string v1, "Flag"

    const/4 v2, 0x1

    invoke-direct {v0, v1, v2}, Lcom/rtfparserkit/rtf/CommandType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/rtfparserkit/rtf/CommandType;->Flag:Lcom/rtfparserkit/rtf/CommandType;

    .line 26
    new-instance v0, Lcom/rtfparserkit/rtf/CommandType;

    const-string v1, "Toggle"

    const/4 v2, 0x2

    invoke-direct {v0, v1, v2}, Lcom/rtfparserkit/rtf/CommandType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/rtfparserkit/rtf/CommandType;->Toggle:Lcom/rtfparserkit/rtf/CommandType;

    .line 27
    new-instance v0, Lcom/rtfparserkit/rtf/CommandType;

    const-string v1, "Value"

    const/4 v2, 0x3

    invoke-direct {v0, v1, v2}, Lcom/rtfparserkit/rtf/CommandType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/rtfparserkit/rtf/CommandType;->Value:Lcom/rtfparserkit/rtf/CommandType;

    .line 28
    new-instance v0, Lcom/rtfparserkit/rtf/CommandType;

    const-string v1, "Destination"

    const/4 v2, 0x4

    invoke-direct {v0, v1, v2}, Lcom/rtfparserkit/rtf/CommandType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/rtfparserkit/rtf/CommandType;->Destination:Lcom/rtfparserkit/rtf/CommandType;

    .line 29
    new-instance v0, Lcom/rtfparserkit/rtf/CommandType;

    const-string v1, "Encoding"

    const/4 v2, 0x5

    invoke-direct {v0, v1, v2}, Lcom/rtfparserkit/rtf/CommandType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/rtfparserkit/rtf/CommandType;->Encoding:Lcom/rtfparserkit/rtf/CommandType;

    .line 22
    invoke-static {}, Lcom/rtfparserkit/rtf/CommandType;->$values()[Lcom/rtfparserkit/rtf/CommandType;

    move-result-object v0

    sput-object v0, Lcom/rtfparserkit/rtf/CommandType;->$VALUES:[Lcom/rtfparserkit/rtf/CommandType;

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

    .line 22
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/rtfparserkit/rtf/CommandType;
    .locals 1
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8000
        }
        names = {
            null
        }
    .end annotation

    .line 22
    const-class v0, Lcom/rtfparserkit/rtf/CommandType;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lcom/rtfparserkit/rtf/CommandType;

    return-object p0
.end method

.method public static values()[Lcom/rtfparserkit/rtf/CommandType;
    .locals 1

    .line 22
    sget-object v0, Lcom/rtfparserkit/rtf/CommandType;->$VALUES:[Lcom/rtfparserkit/rtf/CommandType;

    invoke-virtual {v0}, [Lcom/rtfparserkit/rtf/CommandType;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/rtfparserkit/rtf/CommandType;

    return-object v0
.end method
