.class public Lcom/flyersoft/opds/OpdsEntry$BookUrl;
.super Ljava/lang/Object;
.source "OpdsEntry.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/flyersoft/opds/OpdsEntry;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "BookUrl"
.end annotation


# instance fields
.field public file_size:J

.field public href:Ljava/lang/String;

.field public isZip:Z

.field public type:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    .line 50
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 51
    iput-object p1, p0, Lcom/flyersoft/opds/OpdsEntry$BookUrl;->type:Ljava/lang/String;

    .line 52
    iput-object p2, p0, Lcom/flyersoft/opds/OpdsEntry$BookUrl;->href:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public getExt()Ljava/lang/String;
    .locals 2

    .line 55
    iget-boolean v0, p0, Lcom/flyersoft/opds/OpdsEntry$BookUrl;->isZip:Z

    if-eqz v0, :cond_0

    .line 56
    const-string v0, ".zip"

    return-object v0

    .line 58
    :cond_0
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "."

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v1, p0, Lcom/flyersoft/opds/OpdsEntry$BookUrl;->type:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
