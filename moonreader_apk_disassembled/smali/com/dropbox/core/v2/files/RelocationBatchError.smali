.class public final Lcom/dropbox/core/v2/files/RelocationBatchError;
.super Ljava/lang/Object;
.source "RelocationBatchError.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/dropbox/core/v2/files/RelocationBatchError$Serializer;,
        Lcom/dropbox/core/v2/files/RelocationBatchError$Tag;
    }
.end annotation


# static fields
.field public static final CANT_COPY_SHARED_FOLDER:Lcom/dropbox/core/v2/files/RelocationBatchError;

.field public static final CANT_MOVE_FOLDER_INTO_ITSELF:Lcom/dropbox/core/v2/files/RelocationBatchError;

.field public static final CANT_MOVE_SHARED_FOLDER:Lcom/dropbox/core/v2/files/RelocationBatchError;

.field public static final CANT_NEST_SHARED_FOLDER:Lcom/dropbox/core/v2/files/RelocationBatchError;

.field public static final CANT_TRANSFER_OWNERSHIP:Lcom/dropbox/core/v2/files/RelocationBatchError;

.field public static final DUPLICATED_OR_NESTED_PATHS:Lcom/dropbox/core/v2/files/RelocationBatchError;

.field public static final INSUFFICIENT_QUOTA:Lcom/dropbox/core/v2/files/RelocationBatchError;

.field public static final INTERNAL_ERROR:Lcom/dropbox/core/v2/files/RelocationBatchError;

.field public static final OTHER:Lcom/dropbox/core/v2/files/RelocationBatchError;

.field public static final TOO_MANY_FILES:Lcom/dropbox/core/v2/files/RelocationBatchError;

.field public static final TOO_MANY_WRITE_OPERATIONS:Lcom/dropbox/core/v2/files/RelocationBatchError;


# instance fields
.field private _tag:Lcom/dropbox/core/v2/files/RelocationBatchError$Tag;

.field private cantMoveIntoFamilyValue:Lcom/dropbox/core/v2/files/MoveIntoFamilyError;

.field private cantMoveIntoVaultValue:Lcom/dropbox/core/v2/files/MoveIntoVaultError;

.field private fromLookupValue:Lcom/dropbox/core/v2/files/LookupError;

.field private fromWriteValue:Lcom/dropbox/core/v2/files/WriteError;

.field private toValue:Lcom/dropbox/core/v2/files/WriteError;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 107
    new-instance v0, Lcom/dropbox/core/v2/files/RelocationBatchError;

    invoke-direct {v0}, Lcom/dropbox/core/v2/files/RelocationBatchError;-><init>()V

    sget-object v1, Lcom/dropbox/core/v2/files/RelocationBatchError$Tag;->CANT_COPY_SHARED_FOLDER:Lcom/dropbox/core/v2/files/RelocationBatchError$Tag;

    invoke-direct {v0, v1}, Lcom/dropbox/core/v2/files/RelocationBatchError;->withTag(Lcom/dropbox/core/v2/files/RelocationBatchError$Tag;)Lcom/dropbox/core/v2/files/RelocationBatchError;

    move-result-object v0

    sput-object v0, Lcom/dropbox/core/v2/files/RelocationBatchError;->CANT_COPY_SHARED_FOLDER:Lcom/dropbox/core/v2/files/RelocationBatchError;

    .line 112
    new-instance v0, Lcom/dropbox/core/v2/files/RelocationBatchError;

    invoke-direct {v0}, Lcom/dropbox/core/v2/files/RelocationBatchError;-><init>()V

    sget-object v1, Lcom/dropbox/core/v2/files/RelocationBatchError$Tag;->CANT_NEST_SHARED_FOLDER:Lcom/dropbox/core/v2/files/RelocationBatchError$Tag;

    invoke-direct {v0, v1}, Lcom/dropbox/core/v2/files/RelocationBatchError;->withTag(Lcom/dropbox/core/v2/files/RelocationBatchError$Tag;)Lcom/dropbox/core/v2/files/RelocationBatchError;

    move-result-object v0

    sput-object v0, Lcom/dropbox/core/v2/files/RelocationBatchError;->CANT_NEST_SHARED_FOLDER:Lcom/dropbox/core/v2/files/RelocationBatchError;

    .line 116
    new-instance v0, Lcom/dropbox/core/v2/files/RelocationBatchError;

    invoke-direct {v0}, Lcom/dropbox/core/v2/files/RelocationBatchError;-><init>()V

    sget-object v1, Lcom/dropbox/core/v2/files/RelocationBatchError$Tag;->CANT_MOVE_FOLDER_INTO_ITSELF:Lcom/dropbox/core/v2/files/RelocationBatchError$Tag;

    invoke-direct {v0, v1}, Lcom/dropbox/core/v2/files/RelocationBatchError;->withTag(Lcom/dropbox/core/v2/files/RelocationBatchError$Tag;)Lcom/dropbox/core/v2/files/RelocationBatchError;

    move-result-object v0

    sput-object v0, Lcom/dropbox/core/v2/files/RelocationBatchError;->CANT_MOVE_FOLDER_INTO_ITSELF:Lcom/dropbox/core/v2/files/RelocationBatchError;

    .line 120
    new-instance v0, Lcom/dropbox/core/v2/files/RelocationBatchError;

    invoke-direct {v0}, Lcom/dropbox/core/v2/files/RelocationBatchError;-><init>()V

    sget-object v1, Lcom/dropbox/core/v2/files/RelocationBatchError$Tag;->TOO_MANY_FILES:Lcom/dropbox/core/v2/files/RelocationBatchError$Tag;

    invoke-direct {v0, v1}, Lcom/dropbox/core/v2/files/RelocationBatchError;->withTag(Lcom/dropbox/core/v2/files/RelocationBatchError$Tag;)Lcom/dropbox/core/v2/files/RelocationBatchError;

    move-result-object v0

    sput-object v0, Lcom/dropbox/core/v2/files/RelocationBatchError;->TOO_MANY_FILES:Lcom/dropbox/core/v2/files/RelocationBatchError;

    .line 125
    new-instance v0, Lcom/dropbox/core/v2/files/RelocationBatchError;

    invoke-direct {v0}, Lcom/dropbox/core/v2/files/RelocationBatchError;-><init>()V

    sget-object v1, Lcom/dropbox/core/v2/files/RelocationBatchError$Tag;->DUPLICATED_OR_NESTED_PATHS:Lcom/dropbox/core/v2/files/RelocationBatchError$Tag;

    invoke-direct {v0, v1}, Lcom/dropbox/core/v2/files/RelocationBatchError;->withTag(Lcom/dropbox/core/v2/files/RelocationBatchError$Tag;)Lcom/dropbox/core/v2/files/RelocationBatchError;

    move-result-object v0

    sput-object v0, Lcom/dropbox/core/v2/files/RelocationBatchError;->DUPLICATED_OR_NESTED_PATHS:Lcom/dropbox/core/v2/files/RelocationBatchError;

    .line 131
    new-instance v0, Lcom/dropbox/core/v2/files/RelocationBatchError;

    invoke-direct {v0}, Lcom/dropbox/core/v2/files/RelocationBatchError;-><init>()V

    sget-object v1, Lcom/dropbox/core/v2/files/RelocationBatchError$Tag;->CANT_TRANSFER_OWNERSHIP:Lcom/dropbox/core/v2/files/RelocationBatchError$Tag;

    invoke-direct {v0, v1}, Lcom/dropbox/core/v2/files/RelocationBatchError;->withTag(Lcom/dropbox/core/v2/files/RelocationBatchError$Tag;)Lcom/dropbox/core/v2/files/RelocationBatchError;

    move-result-object v0

    sput-object v0, Lcom/dropbox/core/v2/files/RelocationBatchError;->CANT_TRANSFER_OWNERSHIP:Lcom/dropbox/core/v2/files/RelocationBatchError;

    .line 135
    new-instance v0, Lcom/dropbox/core/v2/files/RelocationBatchError;

    invoke-direct {v0}, Lcom/dropbox/core/v2/files/RelocationBatchError;-><init>()V

    sget-object v1, Lcom/dropbox/core/v2/files/RelocationBatchError$Tag;->INSUFFICIENT_QUOTA:Lcom/dropbox/core/v2/files/RelocationBatchError$Tag;

    invoke-direct {v0, v1}, Lcom/dropbox/core/v2/files/RelocationBatchError;->withTag(Lcom/dropbox/core/v2/files/RelocationBatchError$Tag;)Lcom/dropbox/core/v2/files/RelocationBatchError;

    move-result-object v0

    sput-object v0, Lcom/dropbox/core/v2/files/RelocationBatchError;->INSUFFICIENT_QUOTA:Lcom/dropbox/core/v2/files/RelocationBatchError;

    .line 141
    new-instance v0, Lcom/dropbox/core/v2/files/RelocationBatchError;

    invoke-direct {v0}, Lcom/dropbox/core/v2/files/RelocationBatchError;-><init>()V

    sget-object v1, Lcom/dropbox/core/v2/files/RelocationBatchError$Tag;->INTERNAL_ERROR:Lcom/dropbox/core/v2/files/RelocationBatchError$Tag;

    invoke-direct {v0, v1}, Lcom/dropbox/core/v2/files/RelocationBatchError;->withTag(Lcom/dropbox/core/v2/files/RelocationBatchError$Tag;)Lcom/dropbox/core/v2/files/RelocationBatchError;

    move-result-object v0

    sput-object v0, Lcom/dropbox/core/v2/files/RelocationBatchError;->INTERNAL_ERROR:Lcom/dropbox/core/v2/files/RelocationBatchError;

    .line 145
    new-instance v0, Lcom/dropbox/core/v2/files/RelocationBatchError;

    invoke-direct {v0}, Lcom/dropbox/core/v2/files/RelocationBatchError;-><init>()V

    sget-object v1, Lcom/dropbox/core/v2/files/RelocationBatchError$Tag;->CANT_MOVE_SHARED_FOLDER:Lcom/dropbox/core/v2/files/RelocationBatchError$Tag;

    invoke-direct {v0, v1}, Lcom/dropbox/core/v2/files/RelocationBatchError;->withTag(Lcom/dropbox/core/v2/files/RelocationBatchError$Tag;)Lcom/dropbox/core/v2/files/RelocationBatchError;

    move-result-object v0

    sput-object v0, Lcom/dropbox/core/v2/files/RelocationBatchError;->CANT_MOVE_SHARED_FOLDER:Lcom/dropbox/core/v2/files/RelocationBatchError;

    .line 153
    new-instance v0, Lcom/dropbox/core/v2/files/RelocationBatchError;

    invoke-direct {v0}, Lcom/dropbox/core/v2/files/RelocationBatchError;-><init>()V

    sget-object v1, Lcom/dropbox/core/v2/files/RelocationBatchError$Tag;->OTHER:Lcom/dropbox/core/v2/files/RelocationBatchError$Tag;

    invoke-direct {v0, v1}, Lcom/dropbox/core/v2/files/RelocationBatchError;->withTag(Lcom/dropbox/core/v2/files/RelocationBatchError$Tag;)Lcom/dropbox/core/v2/files/RelocationBatchError;

    move-result-object v0

    sput-object v0, Lcom/dropbox/core/v2/files/RelocationBatchError;->OTHER:Lcom/dropbox/core/v2/files/RelocationBatchError;

    .line 158
    new-instance v0, Lcom/dropbox/core/v2/files/RelocationBatchError;

    invoke-direct {v0}, Lcom/dropbox/core/v2/files/RelocationBatchError;-><init>()V

    sget-object v1, Lcom/dropbox/core/v2/files/RelocationBatchError$Tag;->TOO_MANY_WRITE_OPERATIONS:Lcom/dropbox/core/v2/files/RelocationBatchError$Tag;

    invoke-direct {v0, v1}, Lcom/dropbox/core/v2/files/RelocationBatchError;->withTag(Lcom/dropbox/core/v2/files/RelocationBatchError$Tag;)Lcom/dropbox/core/v2/files/RelocationBatchError;

    move-result-object v0

    sput-object v0, Lcom/dropbox/core/v2/files/RelocationBatchError;->TOO_MANY_WRITE_OPERATIONS:Lcom/dropbox/core/v2/files/RelocationBatchError;

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .line 170
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static synthetic access$000(Lcom/dropbox/core/v2/files/RelocationBatchError;)Lcom/dropbox/core/v2/files/LookupError;
    .locals 0

    .line 25
    iget-object p0, p0, Lcom/dropbox/core/v2/files/RelocationBatchError;->fromLookupValue:Lcom/dropbox/core/v2/files/LookupError;

    return-object p0
.end method

.method static synthetic access$100(Lcom/dropbox/core/v2/files/RelocationBatchError;)Lcom/dropbox/core/v2/files/WriteError;
    .locals 0

    .line 25
    iget-object p0, p0, Lcom/dropbox/core/v2/files/RelocationBatchError;->fromWriteValue:Lcom/dropbox/core/v2/files/WriteError;

    return-object p0
.end method

.method static synthetic access$200(Lcom/dropbox/core/v2/files/RelocationBatchError;)Lcom/dropbox/core/v2/files/WriteError;
    .locals 0

    .line 25
    iget-object p0, p0, Lcom/dropbox/core/v2/files/RelocationBatchError;->toValue:Lcom/dropbox/core/v2/files/WriteError;

    return-object p0
.end method

.method static synthetic access$300(Lcom/dropbox/core/v2/files/RelocationBatchError;)Lcom/dropbox/core/v2/files/MoveIntoVaultError;
    .locals 0

    .line 25
    iget-object p0, p0, Lcom/dropbox/core/v2/files/RelocationBatchError;->cantMoveIntoVaultValue:Lcom/dropbox/core/v2/files/MoveIntoVaultError;

    return-object p0
.end method

.method static synthetic access$400(Lcom/dropbox/core/v2/files/RelocationBatchError;)Lcom/dropbox/core/v2/files/MoveIntoFamilyError;
    .locals 0

    .line 25
    iget-object p0, p0, Lcom/dropbox/core/v2/files/RelocationBatchError;->cantMoveIntoFamilyValue:Lcom/dropbox/core/v2/files/MoveIntoFamilyError;

    return-object p0
.end method

.method public static cantMoveIntoFamily(Lcom/dropbox/core/v2/files/MoveIntoFamilyError;)Lcom/dropbox/core/v2/files/RelocationBatchError;
    .locals 2

    if-eqz p0, :cond_0

    .line 596
    new-instance v0, Lcom/dropbox/core/v2/files/RelocationBatchError;

    invoke-direct {v0}, Lcom/dropbox/core/v2/files/RelocationBatchError;-><init>()V

    sget-object v1, Lcom/dropbox/core/v2/files/RelocationBatchError$Tag;->CANT_MOVE_INTO_FAMILY:Lcom/dropbox/core/v2/files/RelocationBatchError$Tag;

    invoke-direct {v0, v1, p0}, Lcom/dropbox/core/v2/files/RelocationBatchError;->withTagAndCantMoveIntoFamily(Lcom/dropbox/core/v2/files/RelocationBatchError$Tag;Lcom/dropbox/core/v2/files/MoveIntoFamilyError;)Lcom/dropbox/core/v2/files/RelocationBatchError;

    move-result-object p0

    return-object p0

    .line 594
    :cond_0
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string v0, "Value is null"

    invoke-direct {p0, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method public static cantMoveIntoVault(Lcom/dropbox/core/v2/files/MoveIntoVaultError;)Lcom/dropbox/core/v2/files/RelocationBatchError;
    .locals 2

    if-eqz p0, :cond_0

    .line 544
    new-instance v0, Lcom/dropbox/core/v2/files/RelocationBatchError;

    invoke-direct {v0}, Lcom/dropbox/core/v2/files/RelocationBatchError;-><init>()V

    sget-object v1, Lcom/dropbox/core/v2/files/RelocationBatchError$Tag;->CANT_MOVE_INTO_VAULT:Lcom/dropbox/core/v2/files/RelocationBatchError$Tag;

    invoke-direct {v0, v1, p0}, Lcom/dropbox/core/v2/files/RelocationBatchError;->withTagAndCantMoveIntoVault(Lcom/dropbox/core/v2/files/RelocationBatchError$Tag;Lcom/dropbox/core/v2/files/MoveIntoVaultError;)Lcom/dropbox/core/v2/files/RelocationBatchError;

    move-result-object p0

    return-object p0

    .line 542
    :cond_0
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string v0, "Value is null"

    invoke-direct {p0, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method public static fromLookup(Lcom/dropbox/core/v2/files/LookupError;)Lcom/dropbox/core/v2/files/RelocationBatchError;
    .locals 2

    if-eqz p0, :cond_0

    .line 306
    new-instance v0, Lcom/dropbox/core/v2/files/RelocationBatchError;

    invoke-direct {v0}, Lcom/dropbox/core/v2/files/RelocationBatchError;-><init>()V

    sget-object v1, Lcom/dropbox/core/v2/files/RelocationBatchError$Tag;->FROM_LOOKUP:Lcom/dropbox/core/v2/files/RelocationBatchError$Tag;

    invoke-direct {v0, v1, p0}, Lcom/dropbox/core/v2/files/RelocationBatchError;->withTagAndFromLookup(Lcom/dropbox/core/v2/files/RelocationBatchError$Tag;Lcom/dropbox/core/v2/files/LookupError;)Lcom/dropbox/core/v2/files/RelocationBatchError;

    move-result-object p0

    return-object p0

    .line 304
    :cond_0
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string v0, "Value is null"

    invoke-direct {p0, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method public static fromWrite(Lcom/dropbox/core/v2/files/WriteError;)Lcom/dropbox/core/v2/files/RelocationBatchError;
    .locals 2

    if-eqz p0, :cond_0

    .line 352
    new-instance v0, Lcom/dropbox/core/v2/files/RelocationBatchError;

    invoke-direct {v0}, Lcom/dropbox/core/v2/files/RelocationBatchError;-><init>()V

    sget-object v1, Lcom/dropbox/core/v2/files/RelocationBatchError$Tag;->FROM_WRITE:Lcom/dropbox/core/v2/files/RelocationBatchError$Tag;

    invoke-direct {v0, v1, p0}, Lcom/dropbox/core/v2/files/RelocationBatchError;->withTagAndFromWrite(Lcom/dropbox/core/v2/files/RelocationBatchError$Tag;Lcom/dropbox/core/v2/files/WriteError;)Lcom/dropbox/core/v2/files/RelocationBatchError;

    move-result-object p0

    return-object p0

    .line 350
    :cond_0
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string v0, "Value is null"

    invoke-direct {p0, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method public static to(Lcom/dropbox/core/v2/files/WriteError;)Lcom/dropbox/core/v2/files/RelocationBatchError;
    .locals 2

    if-eqz p0, :cond_0

    .line 398
    new-instance v0, Lcom/dropbox/core/v2/files/RelocationBatchError;

    invoke-direct {v0}, Lcom/dropbox/core/v2/files/RelocationBatchError;-><init>()V

    sget-object v1, Lcom/dropbox/core/v2/files/RelocationBatchError$Tag;->TO:Lcom/dropbox/core/v2/files/RelocationBatchError$Tag;

    invoke-direct {v0, v1, p0}, Lcom/dropbox/core/v2/files/RelocationBatchError;->withTagAndTo(Lcom/dropbox/core/v2/files/RelocationBatchError$Tag;Lcom/dropbox/core/v2/files/WriteError;)Lcom/dropbox/core/v2/files/RelocationBatchError;

    move-result-object p0

    return-object p0

    .line 396
    :cond_0
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string v0, "Value is null"

    invoke-direct {p0, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method private withTag(Lcom/dropbox/core/v2/files/RelocationBatchError$Tag;)Lcom/dropbox/core/v2/files/RelocationBatchError;
    .locals 1

    .line 179
    new-instance v0, Lcom/dropbox/core/v2/files/RelocationBatchError;

    invoke-direct {v0}, Lcom/dropbox/core/v2/files/RelocationBatchError;-><init>()V

    .line 180
    iput-object p1, v0, Lcom/dropbox/core/v2/files/RelocationBatchError;->_tag:Lcom/dropbox/core/v2/files/RelocationBatchError$Tag;

    return-object v0
.end method

.method private withTagAndCantMoveIntoFamily(Lcom/dropbox/core/v2/files/RelocationBatchError$Tag;Lcom/dropbox/core/v2/files/MoveIntoFamilyError;)Lcom/dropbox/core/v2/files/RelocationBatchError;
    .locals 1

    .line 257
    new-instance v0, Lcom/dropbox/core/v2/files/RelocationBatchError;

    invoke-direct {v0}, Lcom/dropbox/core/v2/files/RelocationBatchError;-><init>()V

    .line 258
    iput-object p1, v0, Lcom/dropbox/core/v2/files/RelocationBatchError;->_tag:Lcom/dropbox/core/v2/files/RelocationBatchError$Tag;

    .line 259
    iput-object p2, v0, Lcom/dropbox/core/v2/files/RelocationBatchError;->cantMoveIntoFamilyValue:Lcom/dropbox/core/v2/files/MoveIntoFamilyError;

    return-object v0
.end method

.method private withTagAndCantMoveIntoVault(Lcom/dropbox/core/v2/files/RelocationBatchError$Tag;Lcom/dropbox/core/v2/files/MoveIntoVaultError;)Lcom/dropbox/core/v2/files/RelocationBatchError;
    .locals 1

    .line 240
    new-instance v0, Lcom/dropbox/core/v2/files/RelocationBatchError;

    invoke-direct {v0}, Lcom/dropbox/core/v2/files/RelocationBatchError;-><init>()V

    .line 241
    iput-object p1, v0, Lcom/dropbox/core/v2/files/RelocationBatchError;->_tag:Lcom/dropbox/core/v2/files/RelocationBatchError$Tag;

    .line 242
    iput-object p2, v0, Lcom/dropbox/core/v2/files/RelocationBatchError;->cantMoveIntoVaultValue:Lcom/dropbox/core/v2/files/MoveIntoVaultError;

    return-object v0
.end method

.method private withTagAndFromLookup(Lcom/dropbox/core/v2/files/RelocationBatchError$Tag;Lcom/dropbox/core/v2/files/LookupError;)Lcom/dropbox/core/v2/files/RelocationBatchError;
    .locals 1

    .line 193
    new-instance v0, Lcom/dropbox/core/v2/files/RelocationBatchError;

    invoke-direct {v0}, Lcom/dropbox/core/v2/files/RelocationBatchError;-><init>()V

    .line 194
    iput-object p1, v0, Lcom/dropbox/core/v2/files/RelocationBatchError;->_tag:Lcom/dropbox/core/v2/files/RelocationBatchError$Tag;

    .line 195
    iput-object p2, v0, Lcom/dropbox/core/v2/files/RelocationBatchError;->fromLookupValue:Lcom/dropbox/core/v2/files/LookupError;

    return-object v0
.end method

.method private withTagAndFromWrite(Lcom/dropbox/core/v2/files/RelocationBatchError$Tag;Lcom/dropbox/core/v2/files/WriteError;)Lcom/dropbox/core/v2/files/RelocationBatchError;
    .locals 1

    .line 208
    new-instance v0, Lcom/dropbox/core/v2/files/RelocationBatchError;

    invoke-direct {v0}, Lcom/dropbox/core/v2/files/RelocationBatchError;-><init>()V

    .line 209
    iput-object p1, v0, Lcom/dropbox/core/v2/files/RelocationBatchError;->_tag:Lcom/dropbox/core/v2/files/RelocationBatchError$Tag;

    .line 210
    iput-object p2, v0, Lcom/dropbox/core/v2/files/RelocationBatchError;->fromWriteValue:Lcom/dropbox/core/v2/files/WriteError;

    return-object v0
.end method

.method private withTagAndTo(Lcom/dropbox/core/v2/files/RelocationBatchError$Tag;Lcom/dropbox/core/v2/files/WriteError;)Lcom/dropbox/core/v2/files/RelocationBatchError;
    .locals 1

    .line 223
    new-instance v0, Lcom/dropbox/core/v2/files/RelocationBatchError;

    invoke-direct {v0}, Lcom/dropbox/core/v2/files/RelocationBatchError;-><init>()V

    .line 224
    iput-object p1, v0, Lcom/dropbox/core/v2/files/RelocationBatchError;->_tag:Lcom/dropbox/core/v2/files/RelocationBatchError$Tag;

    .line 225
    iput-object p2, v0, Lcom/dropbox/core/v2/files/RelocationBatchError;->toValue:Lcom/dropbox/core/v2/files/WriteError;

    return-object v0
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .locals 4

    const/4 v0, 0x1

    if-ne p1, p0, :cond_0

    return v0

    :cond_0
    const/4 v1, 0x0

    if-nez p1, :cond_1

    return v1

    .line 663
    :cond_1
    instance-of v2, p1, Lcom/dropbox/core/v2/files/RelocationBatchError;

    if-eqz v2, :cond_d

    .line 664
    check-cast p1, Lcom/dropbox/core/v2/files/RelocationBatchError;

    .line 665
    iget-object v2, p0, Lcom/dropbox/core/v2/files/RelocationBatchError;->_tag:Lcom/dropbox/core/v2/files/RelocationBatchError$Tag;

    iget-object v3, p1, Lcom/dropbox/core/v2/files/RelocationBatchError;->_tag:Lcom/dropbox/core/v2/files/RelocationBatchError$Tag;

    if-eq v2, v3, :cond_2

    return v1

    .line 668
    :cond_2
    sget-object v2, Lcom/dropbox/core/v2/files/RelocationBatchError$1;->$SwitchMap$com$dropbox$core$v2$files$RelocationBatchError$Tag:[I

    iget-object v3, p0, Lcom/dropbox/core/v2/files/RelocationBatchError;->_tag:Lcom/dropbox/core/v2/files/RelocationBatchError$Tag;

    invoke-virtual {v3}, Lcom/dropbox/core/v2/files/RelocationBatchError$Tag;->ordinal()I

    move-result v3

    aget v2, v2, v3

    packed-switch v2, :pswitch_data_0

    return v1

    :pswitch_0
    return v0

    .line 696
    :pswitch_1
    iget-object v2, p0, Lcom/dropbox/core/v2/files/RelocationBatchError;->cantMoveIntoFamilyValue:Lcom/dropbox/core/v2/files/MoveIntoFamilyError;

    iget-object p1, p1, Lcom/dropbox/core/v2/files/RelocationBatchError;->cantMoveIntoFamilyValue:Lcom/dropbox/core/v2/files/MoveIntoFamilyError;

    if-eq v2, p1, :cond_4

    invoke-virtual {v2, p1}, Lcom/dropbox/core/v2/files/MoveIntoFamilyError;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_3

    goto :goto_0

    :cond_3
    return v1

    :cond_4
    :goto_0
    return v0

    .line 694
    :pswitch_2
    iget-object v2, p0, Lcom/dropbox/core/v2/files/RelocationBatchError;->cantMoveIntoVaultValue:Lcom/dropbox/core/v2/files/MoveIntoVaultError;

    iget-object p1, p1, Lcom/dropbox/core/v2/files/RelocationBatchError;->cantMoveIntoVaultValue:Lcom/dropbox/core/v2/files/MoveIntoVaultError;

    if-eq v2, p1, :cond_6

    invoke-virtual {v2, p1}, Lcom/dropbox/core/v2/files/MoveIntoVaultError;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_5

    goto :goto_1

    :cond_5
    return v1

    :cond_6
    :goto_1
    :pswitch_3
    return v0

    .line 674
    :pswitch_4
    iget-object v2, p0, Lcom/dropbox/core/v2/files/RelocationBatchError;->toValue:Lcom/dropbox/core/v2/files/WriteError;

    iget-object p1, p1, Lcom/dropbox/core/v2/files/RelocationBatchError;->toValue:Lcom/dropbox/core/v2/files/WriteError;

    if-eq v2, p1, :cond_8

    invoke-virtual {v2, p1}, Lcom/dropbox/core/v2/files/WriteError;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_7

    goto :goto_2

    :cond_7
    return v1

    :cond_8
    :goto_2
    return v0

    .line 672
    :pswitch_5
    iget-object v2, p0, Lcom/dropbox/core/v2/files/RelocationBatchError;->fromWriteValue:Lcom/dropbox/core/v2/files/WriteError;

    iget-object p1, p1, Lcom/dropbox/core/v2/files/RelocationBatchError;->fromWriteValue:Lcom/dropbox/core/v2/files/WriteError;

    if-eq v2, p1, :cond_a

    invoke-virtual {v2, p1}, Lcom/dropbox/core/v2/files/WriteError;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_9

    goto :goto_3

    :cond_9
    return v1

    :cond_a
    :goto_3
    return v0

    .line 670
    :pswitch_6
    iget-object v2, p0, Lcom/dropbox/core/v2/files/RelocationBatchError;->fromLookupValue:Lcom/dropbox/core/v2/files/LookupError;

    iget-object p1, p1, Lcom/dropbox/core/v2/files/RelocationBatchError;->fromLookupValue:Lcom/dropbox/core/v2/files/LookupError;

    if-eq v2, p1, :cond_c

    invoke-virtual {v2, p1}, Lcom/dropbox/core/v2/files/LookupError;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_b

    goto :goto_4

    :cond_b
    return v1

    :cond_c
    :goto_4
    return v0

    :cond_d
    return v1

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_3
        :pswitch_3
        :pswitch_3
        :pswitch_3
        :pswitch_3
        :pswitch_3
        :pswitch_3
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
        :pswitch_0
    .end packed-switch
.end method

.method public getCantMoveIntoFamilyValue()Lcom/dropbox/core/v2/files/MoveIntoFamilyError;
    .locals 3

    .line 613
    iget-object v0, p0, Lcom/dropbox/core/v2/files/RelocationBatchError;->_tag:Lcom/dropbox/core/v2/files/RelocationBatchError$Tag;

    sget-object v1, Lcom/dropbox/core/v2/files/RelocationBatchError$Tag;->CANT_MOVE_INTO_FAMILY:Lcom/dropbox/core/v2/files/RelocationBatchError$Tag;

    if-ne v0, v1, :cond_0

    .line 616
    iget-object v0, p0, Lcom/dropbox/core/v2/files/RelocationBatchError;->cantMoveIntoFamilyValue:Lcom/dropbox/core/v2/files/MoveIntoFamilyError;

    return-object v0

    .line 614
    :cond_0
    new-instance v0, Ljava/lang/IllegalStateException;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Invalid tag: required Tag.CANT_MOVE_INTO_FAMILY, but was Tag."

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v2, p0, Lcom/dropbox/core/v2/files/RelocationBatchError;->_tag:Lcom/dropbox/core/v2/files/RelocationBatchError$Tag;

    invoke-virtual {v2}, Lcom/dropbox/core/v2/files/RelocationBatchError$Tag;->name()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public getCantMoveIntoVaultValue()Lcom/dropbox/core/v2/files/MoveIntoVaultError;
    .locals 3

    .line 561
    iget-object v0, p0, Lcom/dropbox/core/v2/files/RelocationBatchError;->_tag:Lcom/dropbox/core/v2/files/RelocationBatchError$Tag;

    sget-object v1, Lcom/dropbox/core/v2/files/RelocationBatchError$Tag;->CANT_MOVE_INTO_VAULT:Lcom/dropbox/core/v2/files/RelocationBatchError$Tag;

    if-ne v0, v1, :cond_0

    .line 564
    iget-object v0, p0, Lcom/dropbox/core/v2/files/RelocationBatchError;->cantMoveIntoVaultValue:Lcom/dropbox/core/v2/files/MoveIntoVaultError;

    return-object v0

    .line 562
    :cond_0
    new-instance v0, Ljava/lang/IllegalStateException;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Invalid tag: required Tag.CANT_MOVE_INTO_VAULT, but was Tag."

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v2, p0, Lcom/dropbox/core/v2/files/RelocationBatchError;->_tag:Lcom/dropbox/core/v2/files/RelocationBatchError$Tag;

    invoke-virtual {v2}, Lcom/dropbox/core/v2/files/RelocationBatchError$Tag;->name()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public getFromLookupValue()Lcom/dropbox/core/v2/files/LookupError;
    .locals 3

    .line 318
    iget-object v0, p0, Lcom/dropbox/core/v2/files/RelocationBatchError;->_tag:Lcom/dropbox/core/v2/files/RelocationBatchError$Tag;

    sget-object v1, Lcom/dropbox/core/v2/files/RelocationBatchError$Tag;->FROM_LOOKUP:Lcom/dropbox/core/v2/files/RelocationBatchError$Tag;

    if-ne v0, v1, :cond_0

    .line 321
    iget-object v0, p0, Lcom/dropbox/core/v2/files/RelocationBatchError;->fromLookupValue:Lcom/dropbox/core/v2/files/LookupError;

    return-object v0

    .line 319
    :cond_0
    new-instance v0, Ljava/lang/IllegalStateException;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Invalid tag: required Tag.FROM_LOOKUP, but was Tag."

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v2, p0, Lcom/dropbox/core/v2/files/RelocationBatchError;->_tag:Lcom/dropbox/core/v2/files/RelocationBatchError$Tag;

    invoke-virtual {v2}, Lcom/dropbox/core/v2/files/RelocationBatchError$Tag;->name()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public getFromWriteValue()Lcom/dropbox/core/v2/files/WriteError;
    .locals 3

    .line 364
    iget-object v0, p0, Lcom/dropbox/core/v2/files/RelocationBatchError;->_tag:Lcom/dropbox/core/v2/files/RelocationBatchError$Tag;

    sget-object v1, Lcom/dropbox/core/v2/files/RelocationBatchError$Tag;->FROM_WRITE:Lcom/dropbox/core/v2/files/RelocationBatchError$Tag;

    if-ne v0, v1, :cond_0

    .line 367
    iget-object v0, p0, Lcom/dropbox/core/v2/files/RelocationBatchError;->fromWriteValue:Lcom/dropbox/core/v2/files/WriteError;

    return-object v0

    .line 365
    :cond_0
    new-instance v0, Ljava/lang/IllegalStateException;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Invalid tag: required Tag.FROM_WRITE, but was Tag."

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v2, p0, Lcom/dropbox/core/v2/files/RelocationBatchError;->_tag:Lcom/dropbox/core/v2/files/RelocationBatchError$Tag;

    invoke-virtual {v2}, Lcom/dropbox/core/v2/files/RelocationBatchError$Tag;->name()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public getToValue()Lcom/dropbox/core/v2/files/WriteError;
    .locals 3

    .line 410
    iget-object v0, p0, Lcom/dropbox/core/v2/files/RelocationBatchError;->_tag:Lcom/dropbox/core/v2/files/RelocationBatchError$Tag;

    sget-object v1, Lcom/dropbox/core/v2/files/RelocationBatchError$Tag;->TO:Lcom/dropbox/core/v2/files/RelocationBatchError$Tag;

    if-ne v0, v1, :cond_0

    .line 413
    iget-object v0, p0, Lcom/dropbox/core/v2/files/RelocationBatchError;->toValue:Lcom/dropbox/core/v2/files/WriteError;

    return-object v0

    .line 411
    :cond_0
    new-instance v0, Ljava/lang/IllegalStateException;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Invalid tag: required Tag.TO, but was Tag."

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v2, p0, Lcom/dropbox/core/v2/files/RelocationBatchError;->_tag:Lcom/dropbox/core/v2/files/RelocationBatchError$Tag;

    invoke-virtual {v2}, Lcom/dropbox/core/v2/files/RelocationBatchError$Tag;->name()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public hashCode()I
    .locals 8

    .line 643
    iget-object v0, p0, Lcom/dropbox/core/v2/files/RelocationBatchError;->_tag:Lcom/dropbox/core/v2/files/RelocationBatchError$Tag;

    iget-object v1, p0, Lcom/dropbox/core/v2/files/RelocationBatchError;->fromLookupValue:Lcom/dropbox/core/v2/files/LookupError;

    iget-object v2, p0, Lcom/dropbox/core/v2/files/RelocationBatchError;->fromWriteValue:Lcom/dropbox/core/v2/files/WriteError;

    iget-object v3, p0, Lcom/dropbox/core/v2/files/RelocationBatchError;->toValue:Lcom/dropbox/core/v2/files/WriteError;

    iget-object v4, p0, Lcom/dropbox/core/v2/files/RelocationBatchError;->cantMoveIntoVaultValue:Lcom/dropbox/core/v2/files/MoveIntoVaultError;

    iget-object v5, p0, Lcom/dropbox/core/v2/files/RelocationBatchError;->cantMoveIntoFamilyValue:Lcom/dropbox/core/v2/files/MoveIntoFamilyError;

    const/4 v6, 0x6

    new-array v6, v6, [Ljava/lang/Object;

    const/4 v7, 0x0

    aput-object v0, v6, v7

    const/4 v0, 0x1

    aput-object v1, v6, v0

    const/4 v0, 0x2

    aput-object v2, v6, v0

    const/4 v0, 0x3

    aput-object v3, v6, v0

    const/4 v0, 0x4

    aput-object v4, v6, v0

    const/4 v0, 0x5

    aput-object v5, v6, v0

    invoke-static {v6}, Ljava/util/Arrays;->hashCode([Ljava/lang/Object;)I

    move-result v0

    .line 651
    invoke-super {p0}, Ljava/lang/Object;->hashCode()I

    move-result v1

    mul-int/lit8 v1, v1, 0x1f

    add-int/2addr v1, v0

    return v1
.end method

.method public isCantCopySharedFolder()Z
    .locals 2

    .line 424
    iget-object v0, p0, Lcom/dropbox/core/v2/files/RelocationBatchError;->_tag:Lcom/dropbox/core/v2/files/RelocationBatchError$Tag;

    sget-object v1, Lcom/dropbox/core/v2/files/RelocationBatchError$Tag;->CANT_COPY_SHARED_FOLDER:Lcom/dropbox/core/v2/files/RelocationBatchError$Tag;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public isCantMoveFolderIntoItself()Z
    .locals 2

    .line 446
    iget-object v0, p0, Lcom/dropbox/core/v2/files/RelocationBatchError;->_tag:Lcom/dropbox/core/v2/files/RelocationBatchError$Tag;

    sget-object v1, Lcom/dropbox/core/v2/files/RelocationBatchError$Tag;->CANT_MOVE_FOLDER_INTO_ITSELF:Lcom/dropbox/core/v2/files/RelocationBatchError$Tag;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public isCantMoveIntoFamily()Z
    .locals 2

    .line 575
    iget-object v0, p0, Lcom/dropbox/core/v2/files/RelocationBatchError;->_tag:Lcom/dropbox/core/v2/files/RelocationBatchError$Tag;

    sget-object v1, Lcom/dropbox/core/v2/files/RelocationBatchError$Tag;->CANT_MOVE_INTO_FAMILY:Lcom/dropbox/core/v2/files/RelocationBatchError$Tag;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public isCantMoveIntoVault()Z
    .locals 2

    .line 523
    iget-object v0, p0, Lcom/dropbox/core/v2/files/RelocationBatchError;->_tag:Lcom/dropbox/core/v2/files/RelocationBatchError$Tag;

    sget-object v1, Lcom/dropbox/core/v2/files/RelocationBatchError$Tag;->CANT_MOVE_INTO_VAULT:Lcom/dropbox/core/v2/files/RelocationBatchError$Tag;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public isCantMoveSharedFolder()Z
    .locals 2

    .line 512
    iget-object v0, p0, Lcom/dropbox/core/v2/files/RelocationBatchError;->_tag:Lcom/dropbox/core/v2/files/RelocationBatchError$Tag;

    sget-object v1, Lcom/dropbox/core/v2/files/RelocationBatchError$Tag;->CANT_MOVE_SHARED_FOLDER:Lcom/dropbox/core/v2/files/RelocationBatchError$Tag;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public isCantNestSharedFolder()Z
    .locals 2

    .line 435
    iget-object v0, p0, Lcom/dropbox/core/v2/files/RelocationBatchError;->_tag:Lcom/dropbox/core/v2/files/RelocationBatchError$Tag;

    sget-object v1, Lcom/dropbox/core/v2/files/RelocationBatchError$Tag;->CANT_NEST_SHARED_FOLDER:Lcom/dropbox/core/v2/files/RelocationBatchError$Tag;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public isCantTransferOwnership()Z
    .locals 2

    .line 479
    iget-object v0, p0, Lcom/dropbox/core/v2/files/RelocationBatchError;->_tag:Lcom/dropbox/core/v2/files/RelocationBatchError$Tag;

    sget-object v1, Lcom/dropbox/core/v2/files/RelocationBatchError$Tag;->CANT_TRANSFER_OWNERSHIP:Lcom/dropbox/core/v2/files/RelocationBatchError$Tag;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public isDuplicatedOrNestedPaths()Z
    .locals 2

    .line 468
    iget-object v0, p0, Lcom/dropbox/core/v2/files/RelocationBatchError;->_tag:Lcom/dropbox/core/v2/files/RelocationBatchError$Tag;

    sget-object v1, Lcom/dropbox/core/v2/files/RelocationBatchError$Tag;->DUPLICATED_OR_NESTED_PATHS:Lcom/dropbox/core/v2/files/RelocationBatchError$Tag;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public isFromLookup()Z
    .locals 2

    .line 286
    iget-object v0, p0, Lcom/dropbox/core/v2/files/RelocationBatchError;->_tag:Lcom/dropbox/core/v2/files/RelocationBatchError$Tag;

    sget-object v1, Lcom/dropbox/core/v2/files/RelocationBatchError$Tag;->FROM_LOOKUP:Lcom/dropbox/core/v2/files/RelocationBatchError$Tag;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public isFromWrite()Z
    .locals 2

    .line 332
    iget-object v0, p0, Lcom/dropbox/core/v2/files/RelocationBatchError;->_tag:Lcom/dropbox/core/v2/files/RelocationBatchError$Tag;

    sget-object v1, Lcom/dropbox/core/v2/files/RelocationBatchError$Tag;->FROM_WRITE:Lcom/dropbox/core/v2/files/RelocationBatchError$Tag;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public isInsufficientQuota()Z
    .locals 2

    .line 490
    iget-object v0, p0, Lcom/dropbox/core/v2/files/RelocationBatchError;->_tag:Lcom/dropbox/core/v2/files/RelocationBatchError$Tag;

    sget-object v1, Lcom/dropbox/core/v2/files/RelocationBatchError$Tag;->INSUFFICIENT_QUOTA:Lcom/dropbox/core/v2/files/RelocationBatchError$Tag;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public isInternalError()Z
    .locals 2

    .line 501
    iget-object v0, p0, Lcom/dropbox/core/v2/files/RelocationBatchError;->_tag:Lcom/dropbox/core/v2/files/RelocationBatchError$Tag;

    sget-object v1, Lcom/dropbox/core/v2/files/RelocationBatchError$Tag;->INTERNAL_ERROR:Lcom/dropbox/core/v2/files/RelocationBatchError$Tag;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public isOther()Z
    .locals 2

    .line 627
    iget-object v0, p0, Lcom/dropbox/core/v2/files/RelocationBatchError;->_tag:Lcom/dropbox/core/v2/files/RelocationBatchError$Tag;

    sget-object v1, Lcom/dropbox/core/v2/files/RelocationBatchError$Tag;->OTHER:Lcom/dropbox/core/v2/files/RelocationBatchError$Tag;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public isTo()Z
    .locals 2

    .line 378
    iget-object v0, p0, Lcom/dropbox/core/v2/files/RelocationBatchError;->_tag:Lcom/dropbox/core/v2/files/RelocationBatchError$Tag;

    sget-object v1, Lcom/dropbox/core/v2/files/RelocationBatchError$Tag;->TO:Lcom/dropbox/core/v2/files/RelocationBatchError$Tag;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public isTooManyFiles()Z
    .locals 2

    .line 457
    iget-object v0, p0, Lcom/dropbox/core/v2/files/RelocationBatchError;->_tag:Lcom/dropbox/core/v2/files/RelocationBatchError$Tag;

    sget-object v1, Lcom/dropbox/core/v2/files/RelocationBatchError$Tag;->TOO_MANY_FILES:Lcom/dropbox/core/v2/files/RelocationBatchError$Tag;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public isTooManyWriteOperations()Z
    .locals 2

    .line 638
    iget-object v0, p0, Lcom/dropbox/core/v2/files/RelocationBatchError;->_tag:Lcom/dropbox/core/v2/files/RelocationBatchError$Tag;

    sget-object v1, Lcom/dropbox/core/v2/files/RelocationBatchError$Tag;->TOO_MANY_WRITE_OPERATIONS:Lcom/dropbox/core/v2/files/RelocationBatchError$Tag;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public tag()Lcom/dropbox/core/v2/files/RelocationBatchError$Tag;
    .locals 1

    .line 275
    iget-object v0, p0, Lcom/dropbox/core/v2/files/RelocationBatchError;->_tag:Lcom/dropbox/core/v2/files/RelocationBatchError$Tag;

    return-object v0
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .line 712
    sget-object v0, Lcom/dropbox/core/v2/files/RelocationBatchError$Serializer;->INSTANCE:Lcom/dropbox/core/v2/files/RelocationBatchError$Serializer;

    const/4 v1, 0x0

    invoke-virtual {v0, p0, v1}, Lcom/dropbox/core/v2/files/RelocationBatchError$Serializer;->serialize(Ljava/lang/Object;Z)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public toStringMultiline()Ljava/lang/String;
    .locals 2

    .line 724
    sget-object v0, Lcom/dropbox/core/v2/files/RelocationBatchError$Serializer;->INSTANCE:Lcom/dropbox/core/v2/files/RelocationBatchError$Serializer;

    const/4 v1, 0x1

    invoke-virtual {v0, p0, v1}, Lcom/dropbox/core/v2/files/RelocationBatchError$Serializer;->serialize(Ljava/lang/Object;Z)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
