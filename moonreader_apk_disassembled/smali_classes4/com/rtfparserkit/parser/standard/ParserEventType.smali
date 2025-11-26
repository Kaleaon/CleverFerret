.class final enum Lcom/rtfparserkit/parser/standard/ParserEventType;
.super Ljava/lang/Enum;
.source "ParserEventType.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/rtfparserkit/parser/standard/ParserEventType;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/rtfparserkit/parser/standard/ParserEventType;

.field public static final enum BINARY_BYTES_EVENT:Lcom/rtfparserkit/parser/standard/ParserEventType;

.field public static final enum COMMAND_EVENT:Lcom/rtfparserkit/parser/standard/ParserEventType;

.field public static final enum DOCUMENT_END_EVENT:Lcom/rtfparserkit/parser/standard/ParserEventType;

.field public static final enum DOCUMENT_START_EVENT:Lcom/rtfparserkit/parser/standard/ParserEventType;

.field public static final enum GROUP_END_EVENT:Lcom/rtfparserkit/parser/standard/ParserEventType;

.field public static final enum GROUP_START_EVENT:Lcom/rtfparserkit/parser/standard/ParserEventType;

.field public static final enum STRING_EVENT:Lcom/rtfparserkit/parser/standard/ParserEventType;


# direct methods
.method private static synthetic $values()[Lcom/rtfparserkit/parser/standard/ParserEventType;
    .locals 3

    const/4 v0, 0x7

    .line 22
    new-array v0, v0, [Lcom/rtfparserkit/parser/standard/ParserEventType;

    sget-object v1, Lcom/rtfparserkit/parser/standard/ParserEventType;->BINARY_BYTES_EVENT:Lcom/rtfparserkit/parser/standard/ParserEventType;

    const/4 v2, 0x0

    aput-object v1, v0, v2

    sget-object v1, Lcom/rtfparserkit/parser/standard/ParserEventType;->COMMAND_EVENT:Lcom/rtfparserkit/parser/standard/ParserEventType;

    const/4 v2, 0x1

    aput-object v1, v0, v2

    sget-object v1, Lcom/rtfparserkit/parser/standard/ParserEventType;->DOCUMENT_END_EVENT:Lcom/rtfparserkit/parser/standard/ParserEventType;

    const/4 v2, 0x2

    aput-object v1, v0, v2

    sget-object v1, Lcom/rtfparserkit/parser/standard/ParserEventType;->DOCUMENT_START_EVENT:Lcom/rtfparserkit/parser/standard/ParserEventType;

    const/4 v2, 0x3

    aput-object v1, v0, v2

    sget-object v1, Lcom/rtfparserkit/parser/standard/ParserEventType;->GROUP_END_EVENT:Lcom/rtfparserkit/parser/standard/ParserEventType;

    const/4 v2, 0x4

    aput-object v1, v0, v2

    sget-object v1, Lcom/rtfparserkit/parser/standard/ParserEventType;->GROUP_START_EVENT:Lcom/rtfparserkit/parser/standard/ParserEventType;

    const/4 v2, 0x5

    aput-object v1, v0, v2

    sget-object v1, Lcom/rtfparserkit/parser/standard/ParserEventType;->STRING_EVENT:Lcom/rtfparserkit/parser/standard/ParserEventType;

    const/4 v2, 0x6

    aput-object v1, v0, v2

    return-object v0
.end method

.method static constructor <clinit>()V
    .locals 3

    .line 24
    new-instance v0, Lcom/rtfparserkit/parser/standard/ParserEventType;

    const-string v1, "BINARY_BYTES_EVENT"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Lcom/rtfparserkit/parser/standard/ParserEventType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/rtfparserkit/parser/standard/ParserEventType;->BINARY_BYTES_EVENT:Lcom/rtfparserkit/parser/standard/ParserEventType;

    new-instance v0, Lcom/rtfparserkit/parser/standard/ParserEventType;

    const-string v1, "COMMAND_EVENT"

    const/4 v2, 0x1

    invoke-direct {v0, v1, v2}, Lcom/rtfparserkit/parser/standard/ParserEventType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/rtfparserkit/parser/standard/ParserEventType;->COMMAND_EVENT:Lcom/rtfparserkit/parser/standard/ParserEventType;

    new-instance v0, Lcom/rtfparserkit/parser/standard/ParserEventType;

    const-string v1, "DOCUMENT_END_EVENT"

    const/4 v2, 0x2

    invoke-direct {v0, v1, v2}, Lcom/rtfparserkit/parser/standard/ParserEventType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/rtfparserkit/parser/standard/ParserEventType;->DOCUMENT_END_EVENT:Lcom/rtfparserkit/parser/standard/ParserEventType;

    new-instance v0, Lcom/rtfparserkit/parser/standard/ParserEventType;

    const-string v1, "DOCUMENT_START_EVENT"

    const/4 v2, 0x3

    invoke-direct {v0, v1, v2}, Lcom/rtfparserkit/parser/standard/ParserEventType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/rtfparserkit/parser/standard/ParserEventType;->DOCUMENT_START_EVENT:Lcom/rtfparserkit/parser/standard/ParserEventType;

    new-instance v0, Lcom/rtfparserkit/parser/standard/ParserEventType;

    const-string v1, "GROUP_END_EVENT"

    const/4 v2, 0x4

    invoke-direct {v0, v1, v2}, Lcom/rtfparserkit/parser/standard/ParserEventType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/rtfparserkit/parser/standard/ParserEventType;->GROUP_END_EVENT:Lcom/rtfparserkit/parser/standard/ParserEventType;

    new-instance v0, Lcom/rtfparserkit/parser/standard/ParserEventType;

    const-string v1, "GROUP_START_EVENT"

    const/4 v2, 0x5

    invoke-direct {v0, v1, v2}, Lcom/rtfparserkit/parser/standard/ParserEventType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/rtfparserkit/parser/standard/ParserEventType;->GROUP_START_EVENT:Lcom/rtfparserkit/parser/standard/ParserEventType;

    new-instance v0, Lcom/rtfparserkit/parser/standard/ParserEventType;

    const-string v1, "STRING_EVENT"

    const/4 v2, 0x6

    invoke-direct {v0, v1, v2}, Lcom/rtfparserkit/parser/standard/ParserEventType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/rtfparserkit/parser/standard/ParserEventType;->STRING_EVENT:Lcom/rtfparserkit/parser/standard/ParserEventType;

    .line 22
    invoke-static {}, Lcom/rtfparserkit/parser/standard/ParserEventType;->$values()[Lcom/rtfparserkit/parser/standard/ParserEventType;

    move-result-object v0

    sput-object v0, Lcom/rtfparserkit/parser/standard/ParserEventType;->$VALUES:[Lcom/rtfparserkit/parser/standard/ParserEventType;

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

.method public static valueOf(Ljava/lang/String;)Lcom/rtfparserkit/parser/standard/ParserEventType;
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
    const-class v0, Lcom/rtfparserkit/parser/standard/ParserEventType;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lcom/rtfparserkit/parser/standard/ParserEventType;

    return-object p0
.end method

.method public static values()[Lcom/rtfparserkit/parser/standard/ParserEventType;
    .locals 1

    .line 22
    sget-object v0, Lcom/rtfparserkit/parser/standard/ParserEventType;->$VALUES:[Lcom/rtfparserkit/parser/standard/ParserEventType;

    invoke-virtual {v0}, [Lcom/rtfparserkit/parser/standard/ParserEventType;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/rtfparserkit/parser/standard/ParserEventType;

    return-object v0
.end method
