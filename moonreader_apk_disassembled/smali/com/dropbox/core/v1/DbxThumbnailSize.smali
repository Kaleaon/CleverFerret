.class public Lcom/dropbox/core/v1/DbxThumbnailSize;
.super Ljava/lang/Object;
.source "DbxThumbnailSize.java"


# static fields
.field public static final w1024h768:Lcom/dropbox/core/v1/DbxThumbnailSize;

.field public static final w128h128:Lcom/dropbox/core/v1/DbxThumbnailSize;

.field public static final w32h32:Lcom/dropbox/core/v1/DbxThumbnailSize;

.field public static final w640h480:Lcom/dropbox/core/v1/DbxThumbnailSize;

.field public static final w64h64:Lcom/dropbox/core/v1/DbxThumbnailSize;


# instance fields
.field public final height:I

.field public final ident:Ljava/lang/String;

.field public final width:I


# direct methods
.method static constructor <clinit>()V
    .locals 4

    .line 27
    new-instance v0, Lcom/dropbox/core/v1/DbxThumbnailSize;

    const-string v1, "xs"

    const/16 v2, 0x20

    invoke-direct {v0, v1, v2, v2}, Lcom/dropbox/core/v1/DbxThumbnailSize;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/dropbox/core/v1/DbxThumbnailSize;->w32h32:Lcom/dropbox/core/v1/DbxThumbnailSize;

    .line 32
    new-instance v0, Lcom/dropbox/core/v1/DbxThumbnailSize;

    const-string v1, "s"

    const/16 v2, 0x40

    invoke-direct {v0, v1, v2, v2}, Lcom/dropbox/core/v1/DbxThumbnailSize;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/dropbox/core/v1/DbxThumbnailSize;->w64h64:Lcom/dropbox/core/v1/DbxThumbnailSize;

    .line 37
    new-instance v0, Lcom/dropbox/core/v1/DbxThumbnailSize;

    const-string v1, "m"

    const/16 v2, 0x80

    invoke-direct {v0, v1, v2, v2}, Lcom/dropbox/core/v1/DbxThumbnailSize;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/dropbox/core/v1/DbxThumbnailSize;->w128h128:Lcom/dropbox/core/v1/DbxThumbnailSize;

    .line 42
    new-instance v0, Lcom/dropbox/core/v1/DbxThumbnailSize;

    const/16 v1, 0x280

    const/16 v2, 0x1e0

    const-string v3, "l"

    invoke-direct {v0, v3, v1, v2}, Lcom/dropbox/core/v1/DbxThumbnailSize;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/dropbox/core/v1/DbxThumbnailSize;->w640h480:Lcom/dropbox/core/v1/DbxThumbnailSize;

    .line 47
    new-instance v0, Lcom/dropbox/core/v1/DbxThumbnailSize;

    const/16 v1, 0x400

    const/16 v2, 0x300

    const-string v3, "xl"

    invoke-direct {v0, v3, v1, v2}, Lcom/dropbox/core/v1/DbxThumbnailSize;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/dropbox/core/v1/DbxThumbnailSize;->w1024h768:Lcom/dropbox/core/v1/DbxThumbnailSize;

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;II)V
    .locals 0

    .line 13
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 14
    iput-object p1, p0, Lcom/dropbox/core/v1/DbxThumbnailSize;->ident:Ljava/lang/String;

    .line 15
    iput p2, p0, Lcom/dropbox/core/v1/DbxThumbnailSize;->width:I

    .line 16
    iput p3, p0, Lcom/dropbox/core/v1/DbxThumbnailSize;->height:I

    return-void
.end method


# virtual methods
.method public toString()Ljava/lang/String;
    .locals 2

    .line 21
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "("

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v1, p0, Lcom/dropbox/core/v1/DbxThumbnailSize;->ident:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, " "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v1, p0, Lcom/dropbox/core/v1/DbxThumbnailSize;->width:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, "x"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v1, p0, Lcom/dropbox/core/v1/DbxThumbnailSize;->height:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, ")"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
