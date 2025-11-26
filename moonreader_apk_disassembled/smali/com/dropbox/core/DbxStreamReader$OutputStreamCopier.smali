.class public final Lcom/dropbox/core/DbxStreamReader$OutputStreamCopier;
.super Lcom/dropbox/core/DbxStreamReader;
.source "DbxStreamReader.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/dropbox/core/DbxStreamReader;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "OutputStreamCopier"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/dropbox/core/DbxStreamReader<",
        "Ljava/io/IOException;",
        ">;"
    }
.end annotation


# instance fields
.field private final dest:Ljava/io/OutputStream;


# direct methods
.method public constructor <init>(Ljava/io/OutputStream;)V
    .locals 0

    .line 35
    invoke-direct {p0}, Lcom/dropbox/core/DbxStreamReader;-><init>()V

    .line 36
    iput-object p1, p0, Lcom/dropbox/core/DbxStreamReader$OutputStreamCopier;->dest:Ljava/io/OutputStream;

    return-void
.end method


# virtual methods
.method public read(Lcom/dropbox/core/NoThrowInputStream;)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 41
    iget-object v0, p0, Lcom/dropbox/core/DbxStreamReader$OutputStreamCopier;->dest:Ljava/io/OutputStream;

    invoke-static {p1, v0}, Lcom/dropbox/core/util/IOUtil;->copyStreamToStream(Ljava/io/InputStream;Ljava/io/OutputStream;)V

    return-void
.end method
