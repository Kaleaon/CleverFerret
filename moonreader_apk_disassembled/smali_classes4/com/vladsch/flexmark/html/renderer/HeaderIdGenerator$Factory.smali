.class public Lcom/vladsch/flexmark/html/renderer/HeaderIdGenerator$Factory;
.super Ljava/lang/Object;
.source "HeaderIdGenerator.java"

# interfaces
.implements Lcom/vladsch/flexmark/html/renderer/HeaderIdGeneratorFactory;
.implements Lcom/vladsch/flexmark/html/renderer/HtmlIdGeneratorFactory;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vladsch/flexmark/html/renderer/HeaderIdGenerator;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Factory"
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 132
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public create()Lcom/vladsch/flexmark/html/renderer/HtmlIdGenerator;
    .locals 1

    .line 140
    new-instance v0, Lcom/vladsch/flexmark/html/renderer/HeaderIdGenerator;

    invoke-direct {v0}, Lcom/vladsch/flexmark/html/renderer/HeaderIdGenerator;-><init>()V

    return-object v0
.end method

.method public create(Lcom/vladsch/flexmark/html/renderer/LinkResolverContext;)Lcom/vladsch/flexmark/html/renderer/HtmlIdGenerator;
    .locals 0

    .line 135
    new-instance p1, Lcom/vladsch/flexmark/html/renderer/HeaderIdGenerator;

    invoke-direct {p1}, Lcom/vladsch/flexmark/html/renderer/HeaderIdGenerator;-><init>()V

    return-object p1
.end method
