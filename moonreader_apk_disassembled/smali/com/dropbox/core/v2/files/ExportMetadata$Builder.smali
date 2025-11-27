.class public Lcom/dropbox/core/v2/files/ExportMetadata$Builder;
.super Ljava/lang/Object;
.source "ExportMetadata.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/dropbox/core/v2/files/ExportMetadata;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Builder"
.end annotation


# instance fields
.field protected exportHash:Ljava/lang/String;

.field protected final name:Ljava/lang/String;

.field protected paperRevision:Ljava/lang/Long;

.field protected final size:J


# direct methods
.method protected constructor <init>(Ljava/lang/String;J)V
    .locals 0

    .line 159
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    if-eqz p1, :cond_0

    .line 163
    iput-object p1, p0, Lcom/dropbox/core/v2/files/ExportMetadata$Builder;->name:Ljava/lang/String;

    .line 164
    iput-wide p2, p0, Lcom/dropbox/core/v2/files/ExportMetadata$Builder;->size:J

    const/4 p1, 0x0

    .line 165
    iput-object p1, p0, Lcom/dropbox/core/v2/files/ExportMetadata$Builder;->exportHash:Ljava/lang/String;

    .line 166
    iput-object p1, p0, Lcom/dropbox/core/v2/files/ExportMetadata$Builder;->paperRevision:Ljava/lang/Long;

    return-void

    .line 161
    :cond_0
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "Required value for \'name\' is null"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method


# virtual methods
.method public build()Lcom/dropbox/core/v2/files/ExportMetadata;
    .locals 6

    .line 218
    new-instance v0, Lcom/dropbox/core/v2/files/ExportMetadata;

    iget-object v1, p0, Lcom/dropbox/core/v2/files/ExportMetadata$Builder;->name:Ljava/lang/String;

    iget-wide v2, p0, Lcom/dropbox/core/v2/files/ExportMetadata$Builder;->size:J

    iget-object v4, p0, Lcom/dropbox/core/v2/files/ExportMetadata$Builder;->exportHash:Ljava/lang/String;

    iget-object v5, p0, Lcom/dropbox/core/v2/files/ExportMetadata$Builder;->paperRevision:Ljava/lang/Long;

    invoke-direct/range {v0 .. v5}, Lcom/dropbox/core/v2/files/ExportMetadata;-><init>(Ljava/lang/String;JLjava/lang/String;Ljava/lang/Long;)V

    return-object v0
.end method

.method public withExportHash(Ljava/lang/String;)Lcom/dropbox/core/v2/files/ExportMetadata$Builder;
    .locals 2

    if-eqz p1, :cond_2

    .line 186
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v0

    const/16 v1, 0x40

    if-lt v0, v1, :cond_1

    .line 189
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v0

    if-gt v0, v1, :cond_0

    goto :goto_0

    .line 190
    :cond_0
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string v0, "String \'exportHash\' is longer than 64"

    invoke-direct {p1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 187
    :cond_1
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string v0, "String \'exportHash\' is shorter than 64"

    invoke-direct {p1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 193
    :cond_2
    :goto_0
    iput-object p1, p0, Lcom/dropbox/core/v2/files/ExportMetadata$Builder;->exportHash:Ljava/lang/String;

    return-object p0
.end method

.method public withPaperRevision(Ljava/lang/Long;)Lcom/dropbox/core/v2/files/ExportMetadata$Builder;
    .locals 0

    .line 207
    iput-object p1, p0, Lcom/dropbox/core/v2/files/ExportMetadata$Builder;->paperRevision:Ljava/lang/Long;

    return-object p0
.end method
