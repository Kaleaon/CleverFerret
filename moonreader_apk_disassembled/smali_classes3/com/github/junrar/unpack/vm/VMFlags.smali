.class public final enum Lcom/github/junrar/unpack/vm/VMFlags;
.super Ljava/lang/Enum;
.source "VMFlags.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/github/junrar/unpack/vm/VMFlags;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/github/junrar/unpack/vm/VMFlags;

.field public static final enum VM_FC:Lcom/github/junrar/unpack/vm/VMFlags;

.field public static final enum VM_FS:Lcom/github/junrar/unpack/vm/VMFlags;

.field public static final enum VM_FZ:Lcom/github/junrar/unpack/vm/VMFlags;


# instance fields
.field private flag:I


# direct methods
.method static constructor <clinit>()V
    .locals 8

    .line 27
    new-instance v0, Lcom/github/junrar/unpack/vm/VMFlags;

    const-string v1, "VM_FC"

    const/4 v2, 0x0

    const/4 v3, 0x1

    invoke-direct {v0, v1, v2, v3}, Lcom/github/junrar/unpack/vm/VMFlags;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/github/junrar/unpack/vm/VMFlags;->VM_FC:Lcom/github/junrar/unpack/vm/VMFlags;

    .line 28
    new-instance v1, Lcom/github/junrar/unpack/vm/VMFlags;

    const-string v4, "VM_FZ"

    const/4 v5, 0x2

    invoke-direct {v1, v4, v3, v5}, Lcom/github/junrar/unpack/vm/VMFlags;-><init>(Ljava/lang/String;II)V

    sput-object v1, Lcom/github/junrar/unpack/vm/VMFlags;->VM_FZ:Lcom/github/junrar/unpack/vm/VMFlags;

    .line 29
    new-instance v4, Lcom/github/junrar/unpack/vm/VMFlags;

    const-string v6, "VM_FS"

    const/high16 v7, -0x80000000

    invoke-direct {v4, v6, v5, v7}, Lcom/github/junrar/unpack/vm/VMFlags;-><init>(Ljava/lang/String;II)V

    sput-object v4, Lcom/github/junrar/unpack/vm/VMFlags;->VM_FS:Lcom/github/junrar/unpack/vm/VMFlags;

    const/4 v6, 0x3

    .line 26
    new-array v6, v6, [Lcom/github/junrar/unpack/vm/VMFlags;

    aput-object v0, v6, v2

    aput-object v1, v6, v3

    aput-object v4, v6, v5

    sput-object v6, Lcom/github/junrar/unpack/vm/VMFlags;->$VALUES:[Lcom/github/junrar/unpack/vm/VMFlags;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;II)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)V"
        }
    .end annotation

    .line 33
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    .line 34
    iput p3, p0, Lcom/github/junrar/unpack/vm/VMFlags;->flag:I

    return-void
.end method

.method public static findFlag(I)Lcom/github/junrar/unpack/vm/VMFlags;
    .locals 2

    .line 43
    sget-object v0, Lcom/github/junrar/unpack/vm/VMFlags;->VM_FC:Lcom/github/junrar/unpack/vm/VMFlags;

    invoke-virtual {v0, p0}, Lcom/github/junrar/unpack/vm/VMFlags;->equals(I)Z

    move-result v1

    if-eqz v1, :cond_0

    return-object v0

    .line 46
    :cond_0
    sget-object v0, Lcom/github/junrar/unpack/vm/VMFlags;->VM_FS:Lcom/github/junrar/unpack/vm/VMFlags;

    invoke-virtual {v0, p0}, Lcom/github/junrar/unpack/vm/VMFlags;->equals(I)Z

    move-result v1

    if-eqz v1, :cond_1

    return-object v0

    .line 49
    :cond_1
    sget-object v0, Lcom/github/junrar/unpack/vm/VMFlags;->VM_FZ:Lcom/github/junrar/unpack/vm/VMFlags;

    invoke-virtual {v0, p0}, Lcom/github/junrar/unpack/vm/VMFlags;->equals(I)Z

    move-result p0

    if-eqz p0, :cond_2

    return-object v0

    :cond_2
    const/4 p0, 0x0

    return-object p0
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/github/junrar/unpack/vm/VMFlags;
    .locals 1

    .line 26
    const-class v0, Lcom/github/junrar/unpack/vm/VMFlags;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lcom/github/junrar/unpack/vm/VMFlags;

    return-object p0
.end method

.method public static values()[Lcom/github/junrar/unpack/vm/VMFlags;
    .locals 1

    .line 26
    sget-object v0, Lcom/github/junrar/unpack/vm/VMFlags;->$VALUES:[Lcom/github/junrar/unpack/vm/VMFlags;

    invoke-virtual {v0}, [Lcom/github/junrar/unpack/vm/VMFlags;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/github/junrar/unpack/vm/VMFlags;

    return-object v0
.end method


# virtual methods
.method public equals(I)Z
    .locals 1

    .line 61
    iget v0, p0, Lcom/github/junrar/unpack/vm/VMFlags;->flag:I

    if-ne v0, p1, :cond_0

    const/4 p1, 0x1

    return p1

    :cond_0
    const/4 p1, 0x0

    return p1
.end method

.method public getFlag()I
    .locals 1

    .line 68
    iget v0, p0, Lcom/github/junrar/unpack/vm/VMFlags;->flag:I

    return v0
.end method
