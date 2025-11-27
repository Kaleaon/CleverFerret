.class public final enum Lcom/github/junrar/unpack/vm/VMOpType;
.super Ljava/lang/Enum;
.source "VMOpType.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/github/junrar/unpack/vm/VMOpType;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/github/junrar/unpack/vm/VMOpType;

.field public static final enum VM_OPINT:Lcom/github/junrar/unpack/vm/VMOpType;

.field public static final enum VM_OPNONE:Lcom/github/junrar/unpack/vm/VMOpType;

.field public static final enum VM_OPREG:Lcom/github/junrar/unpack/vm/VMOpType;

.field public static final enum VM_OPREGMEM:Lcom/github/junrar/unpack/vm/VMOpType;


# instance fields
.field private opType:I


# direct methods
.method static constructor <clinit>()V
    .locals 9

    .line 27
    new-instance v0, Lcom/github/junrar/unpack/vm/VMOpType;

    const-string v1, "VM_OPREG"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2, v2}, Lcom/github/junrar/unpack/vm/VMOpType;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/github/junrar/unpack/vm/VMOpType;->VM_OPREG:Lcom/github/junrar/unpack/vm/VMOpType;

    .line 28
    new-instance v1, Lcom/github/junrar/unpack/vm/VMOpType;

    const-string v3, "VM_OPINT"

    const/4 v4, 0x1

    invoke-direct {v1, v3, v4, v4}, Lcom/github/junrar/unpack/vm/VMOpType;-><init>(Ljava/lang/String;II)V

    sput-object v1, Lcom/github/junrar/unpack/vm/VMOpType;->VM_OPINT:Lcom/github/junrar/unpack/vm/VMOpType;

    .line 29
    new-instance v3, Lcom/github/junrar/unpack/vm/VMOpType;

    const-string v5, "VM_OPREGMEM"

    const/4 v6, 0x2

    invoke-direct {v3, v5, v6, v6}, Lcom/github/junrar/unpack/vm/VMOpType;-><init>(Ljava/lang/String;II)V

    sput-object v3, Lcom/github/junrar/unpack/vm/VMOpType;->VM_OPREGMEM:Lcom/github/junrar/unpack/vm/VMOpType;

    .line 30
    new-instance v5, Lcom/github/junrar/unpack/vm/VMOpType;

    const-string v7, "VM_OPNONE"

    const/4 v8, 0x3

    invoke-direct {v5, v7, v8, v8}, Lcom/github/junrar/unpack/vm/VMOpType;-><init>(Ljava/lang/String;II)V

    sput-object v5, Lcom/github/junrar/unpack/vm/VMOpType;->VM_OPNONE:Lcom/github/junrar/unpack/vm/VMOpType;

    const/4 v7, 0x4

    .line 26
    new-array v7, v7, [Lcom/github/junrar/unpack/vm/VMOpType;

    aput-object v0, v7, v2

    aput-object v1, v7, v4

    aput-object v3, v7, v6

    aput-object v5, v7, v8

    sput-object v7, Lcom/github/junrar/unpack/vm/VMOpType;->$VALUES:[Lcom/github/junrar/unpack/vm/VMOpType;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;II)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)V"
        }
    .end annotation

    .line 34
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    .line 35
    iput p3, p0, Lcom/github/junrar/unpack/vm/VMOpType;->opType:I

    return-void
.end method

.method public static findOpType(I)Lcom/github/junrar/unpack/vm/VMOpType;
    .locals 2

    .line 48
    sget-object v0, Lcom/github/junrar/unpack/vm/VMOpType;->VM_OPREG:Lcom/github/junrar/unpack/vm/VMOpType;

    invoke-virtual {v0, p0}, Lcom/github/junrar/unpack/vm/VMOpType;->equals(I)Z

    move-result v1

    if-eqz v1, :cond_0

    return-object v0

    .line 53
    :cond_0
    sget-object v0, Lcom/github/junrar/unpack/vm/VMOpType;->VM_OPINT:Lcom/github/junrar/unpack/vm/VMOpType;

    invoke-virtual {v0, p0}, Lcom/github/junrar/unpack/vm/VMOpType;->equals(I)Z

    move-result v1

    if-eqz v1, :cond_1

    return-object v0

    .line 57
    :cond_1
    sget-object v0, Lcom/github/junrar/unpack/vm/VMOpType;->VM_OPREGMEM:Lcom/github/junrar/unpack/vm/VMOpType;

    invoke-virtual {v0, p0}, Lcom/github/junrar/unpack/vm/VMOpType;->equals(I)Z

    move-result v1

    if-eqz v1, :cond_2

    return-object v0

    .line 61
    :cond_2
    sget-object v0, Lcom/github/junrar/unpack/vm/VMOpType;->VM_OPNONE:Lcom/github/junrar/unpack/vm/VMOpType;

    invoke-virtual {v0, p0}, Lcom/github/junrar/unpack/vm/VMOpType;->equals(I)Z

    move-result p0

    if-eqz p0, :cond_3

    return-object v0

    :cond_3
    const/4 p0, 0x0

    return-object p0
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/github/junrar/unpack/vm/VMOpType;
    .locals 1

    .line 26
    const-class v0, Lcom/github/junrar/unpack/vm/VMOpType;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lcom/github/junrar/unpack/vm/VMOpType;

    return-object p0
.end method

.method public static values()[Lcom/github/junrar/unpack/vm/VMOpType;
    .locals 1

    .line 26
    sget-object v0, Lcom/github/junrar/unpack/vm/VMOpType;->$VALUES:[Lcom/github/junrar/unpack/vm/VMOpType;

    invoke-virtual {v0}, [Lcom/github/junrar/unpack/vm/VMOpType;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/github/junrar/unpack/vm/VMOpType;

    return-object v0
.end method


# virtual methods
.method public equals(I)Z
    .locals 1

    .line 44
    iget v0, p0, Lcom/github/junrar/unpack/vm/VMOpType;->opType:I

    if-ne v0, p1, :cond_0

    const/4 p1, 0x1

    return p1

    :cond_0
    const/4 p1, 0x0

    return p1
.end method

.method public getOpType()I
    .locals 1

    .line 39
    iget v0, p0, Lcom/github/junrar/unpack/vm/VMOpType;->opType:I

    return v0
.end method
