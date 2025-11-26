.class public final Lcom/dropbox/core/v1/DbxDelta;
.super Lcom/dropbox/core/util/Dumpable;
.source "DbxDelta.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/dropbox/core/v1/DbxDelta$Entry;,
        Lcom/dropbox/core/v1/DbxDelta$Reader;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<MD:",
        "Lcom/dropbox/core/util/Dumpable;",
        ">",
        "Lcom/dropbox/core/util/Dumpable;"
    }
.end annotation


# instance fields
.field public final cursor:Ljava/lang/String;

.field public final entries:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/dropbox/core/v1/DbxDelta$Entry<",
            "TMD;>;>;"
        }
    .end annotation
.end field

.field public final hasMore:Z

.field public final reset:Z


# direct methods
.method public constructor <init>(ZLjava/util/List;Ljava/lang/String;Z)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(Z",
            "Ljava/util/List<",
            "Lcom/dropbox/core/v1/DbxDelta$Entry<",
            "TMD;>;>;",
            "Ljava/lang/String;",
            "Z)V"
        }
    .end annotation

    .line 73
    invoke-direct {p0}, Lcom/dropbox/core/util/Dumpable;-><init>()V

    .line 74
    iput-boolean p1, p0, Lcom/dropbox/core/v1/DbxDelta;->reset:Z

    .line 75
    iput-object p2, p0, Lcom/dropbox/core/v1/DbxDelta;->entries:Ljava/util/List;

    .line 76
    iput-object p3, p0, Lcom/dropbox/core/v1/DbxDelta;->cursor:Ljava/lang/String;

    .line 77
    iput-boolean p4, p0, Lcom/dropbox/core/v1/DbxDelta;->hasMore:Z

    return-void
.end method


# virtual methods
.method protected dumpFields(Lcom/dropbox/core/util/DumpWriter;)V
    .locals 2

    .line 82
    const-string v0, "reset"

    invoke-virtual {p1, v0}, Lcom/dropbox/core/util/DumpWriter;->f(Ljava/lang/String;)Lcom/dropbox/core/util/DumpWriter;

    move-result-object v0

    iget-boolean v1, p0, Lcom/dropbox/core/v1/DbxDelta;->reset:Z

    invoke-virtual {v0, v1}, Lcom/dropbox/core/util/DumpWriter;->v(Z)Lcom/dropbox/core/util/DumpWriter;

    .line 83
    const-string v0, "hasMore"

    invoke-virtual {p1, v0}, Lcom/dropbox/core/util/DumpWriter;->f(Ljava/lang/String;)Lcom/dropbox/core/util/DumpWriter;

    move-result-object v0

    iget-boolean v1, p0, Lcom/dropbox/core/v1/DbxDelta;->hasMore:Z

    invoke-virtual {v0, v1}, Lcom/dropbox/core/util/DumpWriter;->v(Z)Lcom/dropbox/core/util/DumpWriter;

    .line 84
    const-string v0, "cursor"

    invoke-virtual {p1, v0}, Lcom/dropbox/core/util/DumpWriter;->f(Ljava/lang/String;)Lcom/dropbox/core/util/DumpWriter;

    move-result-object v0

    iget-object v1, p0, Lcom/dropbox/core/v1/DbxDelta;->cursor:Ljava/lang/String;

    invoke-virtual {v0, v1}, Lcom/dropbox/core/util/DumpWriter;->v(Ljava/lang/String;)Lcom/dropbox/core/util/DumpWriter;

    .line 85
    const-string v0, "entries"

    invoke-virtual {p1, v0}, Lcom/dropbox/core/util/DumpWriter;->f(Ljava/lang/String;)Lcom/dropbox/core/util/DumpWriter;

    move-result-object p1

    iget-object v0, p0, Lcom/dropbox/core/v1/DbxDelta;->entries:Ljava/util/List;

    invoke-virtual {p1, v0}, Lcom/dropbox/core/util/DumpWriter;->v(Ljava/lang/Iterable;)Lcom/dropbox/core/util/DumpWriter;

    return-void
.end method
