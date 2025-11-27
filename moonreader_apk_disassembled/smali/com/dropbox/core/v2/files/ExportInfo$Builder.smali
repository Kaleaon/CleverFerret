.class public Lcom/dropbox/core/v2/files/ExportInfo$Builder;
.super Ljava/lang/Object;
.source "ExportInfo.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/dropbox/core/v2/files/ExportInfo;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Builder"
.end annotation


# instance fields
.field protected exportAs:Ljava/lang/String;

.field protected exportOptions:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method protected constructor <init>()V
    .locals 1

    .line 107
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    .line 108
    iput-object v0, p0, Lcom/dropbox/core/v2/files/ExportInfo$Builder;->exportAs:Ljava/lang/String;

    .line 109
    iput-object v0, p0, Lcom/dropbox/core/v2/files/ExportInfo$Builder;->exportOptions:Ljava/util/List;

    return-void
.end method


# virtual methods
.method public build()Lcom/dropbox/core/v2/files/ExportInfo;
    .locals 3

    .line 155
    new-instance v0, Lcom/dropbox/core/v2/files/ExportInfo;

    iget-object v1, p0, Lcom/dropbox/core/v2/files/ExportInfo$Builder;->exportAs:Ljava/lang/String;

    iget-object v2, p0, Lcom/dropbox/core/v2/files/ExportInfo$Builder;->exportOptions:Ljava/util/List;

    invoke-direct {v0, v1, v2}, Lcom/dropbox/core/v2/files/ExportInfo;-><init>(Ljava/lang/String;Ljava/util/List;)V

    return-object v0
.end method

.method public withExportAs(Ljava/lang/String;)Lcom/dropbox/core/v2/files/ExportInfo$Builder;
    .locals 0

    .line 120
    iput-object p1, p0, Lcom/dropbox/core/v2/files/ExportInfo$Builder;->exportAs:Ljava/lang/String;

    return-object p0
.end method

.method public withExportOptions(Ljava/util/List;)Lcom/dropbox/core/v2/files/ExportInfo$Builder;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;)",
            "Lcom/dropbox/core/v2/files/ExportInfo$Builder;"
        }
    .end annotation

    if-eqz p1, :cond_1

    .line 138
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    if-eqz v1, :cond_0

    goto :goto_0

    .line 140
    :cond_0
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string v0, "An item in list \'exportOptions\' is null"

    invoke-direct {p1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 144
    :cond_1
    iput-object p1, p0, Lcom/dropbox/core/v2/files/ExportInfo$Builder;->exportOptions:Ljava/util/List;

    return-object p0
.end method
