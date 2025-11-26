.class public final enum Lcom/github/junrar/rarfile/UnrarHeadertype;
.super Ljava/lang/Enum;
.source "UnrarHeadertype.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/github/junrar/rarfile/UnrarHeadertype;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/github/junrar/rarfile/UnrarHeadertype;

.field public static final enum AvHeader:Lcom/github/junrar/rarfile/UnrarHeadertype;

.field public static final enum CommHeader:Lcom/github/junrar/rarfile/UnrarHeadertype;

.field public static final enum EndArcHeader:Lcom/github/junrar/rarfile/UnrarHeadertype;

.field public static final enum FileHeader:Lcom/github/junrar/rarfile/UnrarHeadertype;

.field public static final enum MainHeader:Lcom/github/junrar/rarfile/UnrarHeadertype;

.field public static final enum MarkHeader:Lcom/github/junrar/rarfile/UnrarHeadertype;

.field public static final enum NewSubHeader:Lcom/github/junrar/rarfile/UnrarHeadertype;

.field public static final enum ProtectHeader:Lcom/github/junrar/rarfile/UnrarHeadertype;

.field public static final enum SignHeader:Lcom/github/junrar/rarfile/UnrarHeadertype;

.field public static final enum SubHeader:Lcom/github/junrar/rarfile/UnrarHeadertype;


# instance fields
.field private headerByte:B


# direct methods
.method static constructor <clinit>()V
    .locals 22

    .line 30
    new-instance v0, Lcom/github/junrar/rarfile/UnrarHeadertype;

    const/16 v1, 0x73

    const-string v2, "MainHeader"

    const/4 v3, 0x0

    invoke-direct {v0, v2, v3, v1}, Lcom/github/junrar/rarfile/UnrarHeadertype;-><init>(Ljava/lang/String;IB)V

    sput-object v0, Lcom/github/junrar/rarfile/UnrarHeadertype;->MainHeader:Lcom/github/junrar/rarfile/UnrarHeadertype;

    .line 31
    new-instance v1, Lcom/github/junrar/rarfile/UnrarHeadertype;

    const/16 v2, 0x72

    const-string v4, "MarkHeader"

    const/4 v5, 0x1

    invoke-direct {v1, v4, v5, v2}, Lcom/github/junrar/rarfile/UnrarHeadertype;-><init>(Ljava/lang/String;IB)V

    sput-object v1, Lcom/github/junrar/rarfile/UnrarHeadertype;->MarkHeader:Lcom/github/junrar/rarfile/UnrarHeadertype;

    .line 32
    new-instance v2, Lcom/github/junrar/rarfile/UnrarHeadertype;

    const/16 v4, 0x74

    const-string v6, "FileHeader"

    const/4 v7, 0x2

    invoke-direct {v2, v6, v7, v4}, Lcom/github/junrar/rarfile/UnrarHeadertype;-><init>(Ljava/lang/String;IB)V

    sput-object v2, Lcom/github/junrar/rarfile/UnrarHeadertype;->FileHeader:Lcom/github/junrar/rarfile/UnrarHeadertype;

    .line 33
    new-instance v4, Lcom/github/junrar/rarfile/UnrarHeadertype;

    const/16 v6, 0x75

    const-string v8, "CommHeader"

    const/4 v9, 0x3

    invoke-direct {v4, v8, v9, v6}, Lcom/github/junrar/rarfile/UnrarHeadertype;-><init>(Ljava/lang/String;IB)V

    sput-object v4, Lcom/github/junrar/rarfile/UnrarHeadertype;->CommHeader:Lcom/github/junrar/rarfile/UnrarHeadertype;

    .line 34
    new-instance v6, Lcom/github/junrar/rarfile/UnrarHeadertype;

    const/16 v8, 0x76

    const-string v10, "AvHeader"

    const/4 v11, 0x4

    invoke-direct {v6, v10, v11, v8}, Lcom/github/junrar/rarfile/UnrarHeadertype;-><init>(Ljava/lang/String;IB)V

    sput-object v6, Lcom/github/junrar/rarfile/UnrarHeadertype;->AvHeader:Lcom/github/junrar/rarfile/UnrarHeadertype;

    .line 35
    new-instance v8, Lcom/github/junrar/rarfile/UnrarHeadertype;

    const/16 v10, 0x77

    const-string v12, "SubHeader"

    const/4 v13, 0x5

    invoke-direct {v8, v12, v13, v10}, Lcom/github/junrar/rarfile/UnrarHeadertype;-><init>(Ljava/lang/String;IB)V

    sput-object v8, Lcom/github/junrar/rarfile/UnrarHeadertype;->SubHeader:Lcom/github/junrar/rarfile/UnrarHeadertype;

    .line 36
    new-instance v10, Lcom/github/junrar/rarfile/UnrarHeadertype;

    const/16 v12, 0x78

    const-string v14, "ProtectHeader"

    const/4 v15, 0x6

    invoke-direct {v10, v14, v15, v12}, Lcom/github/junrar/rarfile/UnrarHeadertype;-><init>(Ljava/lang/String;IB)V

    sput-object v10, Lcom/github/junrar/rarfile/UnrarHeadertype;->ProtectHeader:Lcom/github/junrar/rarfile/UnrarHeadertype;

    .line 37
    new-instance v12, Lcom/github/junrar/rarfile/UnrarHeadertype;

    const/16 v14, 0x79

    const/16 v16, 0x0

    const-string v3, "SignHeader"

    const/16 v17, 0x1

    const/4 v5, 0x7

    invoke-direct {v12, v3, v5, v14}, Lcom/github/junrar/rarfile/UnrarHeadertype;-><init>(Ljava/lang/String;IB)V

    sput-object v12, Lcom/github/junrar/rarfile/UnrarHeadertype;->SignHeader:Lcom/github/junrar/rarfile/UnrarHeadertype;

    .line 38
    new-instance v3, Lcom/github/junrar/rarfile/UnrarHeadertype;

    const/16 v14, 0x7a

    const/16 v18, 0x7

    const-string v5, "NewSubHeader"

    const/16 v19, 0x2

    const/16 v7, 0x8

    invoke-direct {v3, v5, v7, v14}, Lcom/github/junrar/rarfile/UnrarHeadertype;-><init>(Ljava/lang/String;IB)V

    sput-object v3, Lcom/github/junrar/rarfile/UnrarHeadertype;->NewSubHeader:Lcom/github/junrar/rarfile/UnrarHeadertype;

    .line 39
    new-instance v5, Lcom/github/junrar/rarfile/UnrarHeadertype;

    const/16 v14, 0x7b

    const/16 v20, 0x8

    const-string v7, "EndArcHeader"

    const/16 v21, 0x3

    const/16 v9, 0x9

    invoke-direct {v5, v7, v9, v14}, Lcom/github/junrar/rarfile/UnrarHeadertype;-><init>(Ljava/lang/String;IB)V

    sput-object v5, Lcom/github/junrar/rarfile/UnrarHeadertype;->EndArcHeader:Lcom/github/junrar/rarfile/UnrarHeadertype;

    const/16 v7, 0xa

    .line 27
    new-array v7, v7, [Lcom/github/junrar/rarfile/UnrarHeadertype;

    aput-object v0, v7, v16

    aput-object v1, v7, v17

    aput-object v2, v7, v19

    aput-object v4, v7, v21

    aput-object v6, v7, v11

    aput-object v8, v7, v13

    aput-object v10, v7, v15

    aput-object v12, v7, v18

    aput-object v3, v7, v20

    aput-object v5, v7, v9

    sput-object v7, Lcom/github/junrar/rarfile/UnrarHeadertype;->$VALUES:[Lcom/github/junrar/rarfile/UnrarHeadertype;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;IB)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(B)V"
        }
    .end annotation

    .line 94
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    .line 95
    iput-byte p3, p0, Lcom/github/junrar/rarfile/UnrarHeadertype;->headerByte:B

    return-void
.end method

.method public static findType(B)Lcom/github/junrar/rarfile/UnrarHeadertype;
    .locals 6

    .line 47
    sget-object v0, Lcom/github/junrar/rarfile/UnrarHeadertype;->MarkHeader:Lcom/github/junrar/rarfile/UnrarHeadertype;

    invoke-virtual {v0, p0}, Lcom/github/junrar/rarfile/UnrarHeadertype;->equals(B)Z

    move-result v1

    if-eqz v1, :cond_0

    goto :goto_0

    .line 50
    :cond_0
    sget-object v1, Lcom/github/junrar/rarfile/UnrarHeadertype;->MainHeader:Lcom/github/junrar/rarfile/UnrarHeadertype;

    invoke-virtual {v1, p0}, Lcom/github/junrar/rarfile/UnrarHeadertype;->equals(B)Z

    move-result v2

    if-eqz v2, :cond_1

    goto :goto_1

    .line 53
    :cond_1
    sget-object v2, Lcom/github/junrar/rarfile/UnrarHeadertype;->FileHeader:Lcom/github/junrar/rarfile/UnrarHeadertype;

    invoke-virtual {v2, p0}, Lcom/github/junrar/rarfile/UnrarHeadertype;->equals(B)Z

    move-result v3

    if-eqz v3, :cond_2

    goto :goto_2

    .line 56
    :cond_2
    sget-object v3, Lcom/github/junrar/rarfile/UnrarHeadertype;->EndArcHeader:Lcom/github/junrar/rarfile/UnrarHeadertype;

    invoke-virtual {v3, p0}, Lcom/github/junrar/rarfile/UnrarHeadertype;->equals(B)Z

    move-result v4

    if-eqz v4, :cond_3

    goto :goto_3

    .line 59
    :cond_3
    sget-object v4, Lcom/github/junrar/rarfile/UnrarHeadertype;->NewSubHeader:Lcom/github/junrar/rarfile/UnrarHeadertype;

    invoke-virtual {v4, p0}, Lcom/github/junrar/rarfile/UnrarHeadertype;->equals(B)Z

    move-result v5

    if-eqz v5, :cond_4

    return-object v4

    .line 62
    :cond_4
    sget-object v4, Lcom/github/junrar/rarfile/UnrarHeadertype;->SubHeader:Lcom/github/junrar/rarfile/UnrarHeadertype;

    invoke-virtual {v4, p0}, Lcom/github/junrar/rarfile/UnrarHeadertype;->equals(B)Z

    move-result v5

    if-eqz v5, :cond_5

    return-object v4

    .line 65
    :cond_5
    sget-object v4, Lcom/github/junrar/rarfile/UnrarHeadertype;->SignHeader:Lcom/github/junrar/rarfile/UnrarHeadertype;

    invoke-virtual {v4, p0}, Lcom/github/junrar/rarfile/UnrarHeadertype;->equals(B)Z

    move-result v5

    if-eqz v5, :cond_6

    return-object v4

    .line 68
    :cond_6
    sget-object v4, Lcom/github/junrar/rarfile/UnrarHeadertype;->ProtectHeader:Lcom/github/junrar/rarfile/UnrarHeadertype;

    invoke-virtual {v4, p0}, Lcom/github/junrar/rarfile/UnrarHeadertype;->equals(B)Z

    move-result v5

    if-eqz v5, :cond_7

    return-object v4

    .line 71
    :cond_7
    invoke-virtual {v0, p0}, Lcom/github/junrar/rarfile/UnrarHeadertype;->equals(B)Z

    move-result v4

    if-eqz v4, :cond_8

    :goto_0
    return-object v0

    .line 74
    :cond_8
    invoke-virtual {v1, p0}, Lcom/github/junrar/rarfile/UnrarHeadertype;->equals(B)Z

    move-result v0

    if-eqz v0, :cond_9

    :goto_1
    return-object v1

    .line 77
    :cond_9
    invoke-virtual {v2, p0}, Lcom/github/junrar/rarfile/UnrarHeadertype;->equals(B)Z

    move-result v0

    if-eqz v0, :cond_a

    :goto_2
    return-object v2

    .line 80
    :cond_a
    invoke-virtual {v3, p0}, Lcom/github/junrar/rarfile/UnrarHeadertype;->equals(B)Z

    move-result v0

    if-eqz v0, :cond_b

    :goto_3
    return-object v3

    .line 83
    :cond_b
    sget-object v0, Lcom/github/junrar/rarfile/UnrarHeadertype;->CommHeader:Lcom/github/junrar/rarfile/UnrarHeadertype;

    invoke-virtual {v0, p0}, Lcom/github/junrar/rarfile/UnrarHeadertype;->equals(B)Z

    move-result v1

    if-eqz v1, :cond_c

    return-object v0

    .line 86
    :cond_c
    sget-object v0, Lcom/github/junrar/rarfile/UnrarHeadertype;->AvHeader:Lcom/github/junrar/rarfile/UnrarHeadertype;

    invoke-virtual {v0, p0}, Lcom/github/junrar/rarfile/UnrarHeadertype;->equals(B)Z

    move-result p0

    if-eqz p0, :cond_d

    return-object v0

    :cond_d
    const/4 p0, 0x0

    return-object p0
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/github/junrar/rarfile/UnrarHeadertype;
    .locals 1

    .line 27
    const-class v0, Lcom/github/junrar/rarfile/UnrarHeadertype;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lcom/github/junrar/rarfile/UnrarHeadertype;

    return-object p0
.end method

.method public static values()[Lcom/github/junrar/rarfile/UnrarHeadertype;
    .locals 1

    .line 27
    sget-object v0, Lcom/github/junrar/rarfile/UnrarHeadertype;->$VALUES:[Lcom/github/junrar/rarfile/UnrarHeadertype;

    invoke-virtual {v0}, [Lcom/github/junrar/rarfile/UnrarHeadertype;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/github/junrar/rarfile/UnrarHeadertype;

    return-object v0
.end method


# virtual methods
.method public equals(B)Z
    .locals 1

    .line 104
    iget-byte v0, p0, Lcom/github/junrar/rarfile/UnrarHeadertype;->headerByte:B

    if-ne v0, p1, :cond_0

    const/4 p1, 0x1

    return p1

    :cond_0
    const/4 p1, 0x0

    return p1
.end method

.method public getHeaderByte()B
    .locals 1

    .line 112
    iget-byte v0, p0, Lcom/github/junrar/rarfile/UnrarHeadertype;->headerByte:B

    return v0
.end method
