.class public Lcom/flyersoft/opds/OpdsJson;
.super Ljava/lang/Object;
.source "OpdsJson.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/flyersoft/opds/OpdsJson$FacetItem;,
        Lcom/flyersoft/opds/OpdsJson$ImageItem;,
        Lcom/flyersoft/opds/OpdsJson$Item;,
        Lcom/flyersoft/opds/OpdsJson$Publications;,
        Lcom/flyersoft/opds/OpdsJson$Groups;,
        Lcom/flyersoft/opds/OpdsJson$Links;,
        Lcom/flyersoft/opds/OpdsJson$Metadata;,
        Lcom/flyersoft/opds/OpdsJson$Navigation;
    }
.end annotation


# instance fields
.field groups:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Lcom/flyersoft/opds/OpdsJson$Groups;",
            ">;"
        }
    .end annotation
.end field

.field links:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Lcom/flyersoft/opds/OpdsJson$Links;",
            ">;"
        }
    .end annotation
.end field

.field metadata:Lcom/flyersoft/opds/OpdsJson$Metadata;

.field navigation:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Lcom/flyersoft/opds/OpdsJson$Navigation;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 10
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static getEntries(Ljava/lang/String;)Ljava/util/ArrayList;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/ArrayList<",
            "Lcom/flyersoft/opds/OpdsEntry;",
            ">;"
        }
    .end annotation

    .line 22
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 26
    :try_start_0
    const-class v1, Lcom/flyersoft/opds/OpdsJson;

    invoke-static {p0, v1}, Lcom/flyersoft/tools/T;->fromJsonText(Ljava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/flyersoft/opds/OpdsJson;

    .line 27
    invoke-virtual {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p0

    const/4 v1, 0x1

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    aput-object p0, v1, v2

    invoke-static {v1}, Lcom/flyersoft/tools/A;->log([Ljava/lang/Object;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-object v0

    :catch_0
    move-exception p0

    .line 29
    invoke-static {p0}, Lcom/flyersoft/tools/A;->error(Ljava/lang/Throwable;)V

    return-object v0
.end method
