.class public Lcom/vladsch/flexmark/util/TemplateUtil$MappedResolver;
.super Ljava/lang/Object;
.source "TemplateUtil.java"

# interfaces
.implements Lcom/vladsch/flexmark/util/TemplateUtil$Resolver;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vladsch/flexmark/util/TemplateUtil;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "MappedResolver"
.end annotation


# instance fields
.field protected final myMap:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 24
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    invoke-direct {p0, v0}, Lcom/vladsch/flexmark/util/TemplateUtil$MappedResolver;-><init>(Ljava/util/Map;)V

    return-void
.end method

.method public constructor <init>(Ljava/util/Map;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .line 19
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 20
    iput-object p1, p0, Lcom/vladsch/flexmark/util/TemplateUtil$MappedResolver;->myMap:Ljava/util/Map;

    return-void
.end method


# virtual methods
.method public getMMap()Ljava/util/Map;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 33
    iget-object v0, p0, Lcom/vladsch/flexmark/util/TemplateUtil$MappedResolver;->myMap:Ljava/util/Map;

    return-object v0
.end method

.method public resolve([Ljava/lang/String;)Ljava/lang/String;
    .locals 2

    .line 38
    array-length v0, p1

    const/4 v1, 0x2

    if-le v0, v1, :cond_0

    const/4 p1, 0x0

    return-object p1

    :cond_0
    iget-object v0, p0, Lcom/vladsch/flexmark/util/TemplateUtil$MappedResolver;->myMap:Ljava/util/Map;

    const/4 v1, 0x1

    aget-object p1, p1, v1

    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/String;

    return-object p1
.end method

.method public set(Ljava/lang/String;Ljava/lang/String;)Lcom/vladsch/flexmark/util/TemplateUtil$MappedResolver;
    .locals 1

    .line 28
    iget-object v0, p0, Lcom/vladsch/flexmark/util/TemplateUtil$MappedResolver;->myMap:Ljava/util/Map;

    invoke-interface {v0, p1, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    return-object p0
.end method
