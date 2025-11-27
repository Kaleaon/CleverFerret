.class public final enum Lcom/github/junrar/unpack/decode/CodeType;
.super Ljava/lang/Enum;
.source "CodeType.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/github/junrar/unpack/decode/CodeType;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/github/junrar/unpack/decode/CodeType;

.field public static final enum CODE_CACHELZ:Lcom/github/junrar/unpack/decode/CodeType;

.field public static final enum CODE_ENDFILE:Lcom/github/junrar/unpack/decode/CodeType;

.field public static final enum CODE_HUFFMAN:Lcom/github/junrar/unpack/decode/CodeType;

.field public static final enum CODE_LZ:Lcom/github/junrar/unpack/decode/CodeType;

.field public static final enum CODE_LZ2:Lcom/github/junrar/unpack/decode/CodeType;

.field public static final enum CODE_REPEATLZ:Lcom/github/junrar/unpack/decode/CodeType;

.field public static final enum CODE_STARTFILE:Lcom/github/junrar/unpack/decode/CodeType;

.field public static final enum CODE_VM:Lcom/github/junrar/unpack/decode/CodeType;

.field public static final enum CODE_VMDATA:Lcom/github/junrar/unpack/decode/CodeType;


# direct methods
.method static constructor <clinit>()V
    .locals 19

    .line 27
    new-instance v0, Lcom/github/junrar/unpack/decode/CodeType;

    const-string v1, "CODE_HUFFMAN"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Lcom/github/junrar/unpack/decode/CodeType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/github/junrar/unpack/decode/CodeType;->CODE_HUFFMAN:Lcom/github/junrar/unpack/decode/CodeType;

    new-instance v1, Lcom/github/junrar/unpack/decode/CodeType;

    const-string v3, "CODE_LZ"

    const/4 v4, 0x1

    invoke-direct {v1, v3, v4}, Lcom/github/junrar/unpack/decode/CodeType;-><init>(Ljava/lang/String;I)V

    sput-object v1, Lcom/github/junrar/unpack/decode/CodeType;->CODE_LZ:Lcom/github/junrar/unpack/decode/CodeType;

    new-instance v3, Lcom/github/junrar/unpack/decode/CodeType;

    const-string v5, "CODE_LZ2"

    const/4 v6, 0x2

    invoke-direct {v3, v5, v6}, Lcom/github/junrar/unpack/decode/CodeType;-><init>(Ljava/lang/String;I)V

    sput-object v3, Lcom/github/junrar/unpack/decode/CodeType;->CODE_LZ2:Lcom/github/junrar/unpack/decode/CodeType;

    new-instance v5, Lcom/github/junrar/unpack/decode/CodeType;

    const-string v7, "CODE_REPEATLZ"

    const/4 v8, 0x3

    invoke-direct {v5, v7, v8}, Lcom/github/junrar/unpack/decode/CodeType;-><init>(Ljava/lang/String;I)V

    sput-object v5, Lcom/github/junrar/unpack/decode/CodeType;->CODE_REPEATLZ:Lcom/github/junrar/unpack/decode/CodeType;

    new-instance v7, Lcom/github/junrar/unpack/decode/CodeType;

    const-string v9, "CODE_CACHELZ"

    const/4 v10, 0x4

    invoke-direct {v7, v9, v10}, Lcom/github/junrar/unpack/decode/CodeType;-><init>(Ljava/lang/String;I)V

    sput-object v7, Lcom/github/junrar/unpack/decode/CodeType;->CODE_CACHELZ:Lcom/github/junrar/unpack/decode/CodeType;

    .line 28
    new-instance v9, Lcom/github/junrar/unpack/decode/CodeType;

    const-string v11, "CODE_STARTFILE"

    const/4 v12, 0x5

    invoke-direct {v9, v11, v12}, Lcom/github/junrar/unpack/decode/CodeType;-><init>(Ljava/lang/String;I)V

    sput-object v9, Lcom/github/junrar/unpack/decode/CodeType;->CODE_STARTFILE:Lcom/github/junrar/unpack/decode/CodeType;

    new-instance v11, Lcom/github/junrar/unpack/decode/CodeType;

    const-string v13, "CODE_ENDFILE"

    const/4 v14, 0x6

    invoke-direct {v11, v13, v14}, Lcom/github/junrar/unpack/decode/CodeType;-><init>(Ljava/lang/String;I)V

    sput-object v11, Lcom/github/junrar/unpack/decode/CodeType;->CODE_ENDFILE:Lcom/github/junrar/unpack/decode/CodeType;

    new-instance v13, Lcom/github/junrar/unpack/decode/CodeType;

    const-string v15, "CODE_VM"

    const/16 v16, 0x0

    const/4 v2, 0x7

    invoke-direct {v13, v15, v2}, Lcom/github/junrar/unpack/decode/CodeType;-><init>(Ljava/lang/String;I)V

    sput-object v13, Lcom/github/junrar/unpack/decode/CodeType;->CODE_VM:Lcom/github/junrar/unpack/decode/CodeType;

    new-instance v15, Lcom/github/junrar/unpack/decode/CodeType;

    const/16 v17, 0x7

    const-string v2, "CODE_VMDATA"

    const/16 v18, 0x1

    const/16 v4, 0x8

    invoke-direct {v15, v2, v4}, Lcom/github/junrar/unpack/decode/CodeType;-><init>(Ljava/lang/String;I)V

    sput-object v15, Lcom/github/junrar/unpack/decode/CodeType;->CODE_VMDATA:Lcom/github/junrar/unpack/decode/CodeType;

    const/16 v2, 0x9

    .line 26
    new-array v2, v2, [Lcom/github/junrar/unpack/decode/CodeType;

    aput-object v0, v2, v16

    aput-object v1, v2, v18

    aput-object v3, v2, v6

    aput-object v5, v2, v8

    aput-object v7, v2, v10

    aput-object v9, v2, v12

    aput-object v11, v2, v14

    aput-object v13, v2, v17

    aput-object v15, v2, v4

    sput-object v2, Lcom/github/junrar/unpack/decode/CodeType;->$VALUES:[Lcom/github/junrar/unpack/decode/CodeType;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 26
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/github/junrar/unpack/decode/CodeType;
    .locals 1

    .line 26
    const-class v0, Lcom/github/junrar/unpack/decode/CodeType;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lcom/github/junrar/unpack/decode/CodeType;

    return-object p0
.end method

.method public static values()[Lcom/github/junrar/unpack/decode/CodeType;
    .locals 1

    .line 26
    sget-object v0, Lcom/github/junrar/unpack/decode/CodeType;->$VALUES:[Lcom/github/junrar/unpack/decode/CodeType;

    invoke-virtual {v0}, [Lcom/github/junrar/unpack/decode/CodeType;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/github/junrar/unpack/decode/CodeType;

    return-object v0
.end method
