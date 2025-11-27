.class public Lcom/vladsch/flexmark/html/EmbeddedAttributeProvider;
.super Ljava/lang/Object;
.source "EmbeddedAttributeProvider.java"

# interfaces
.implements Lcom/vladsch/flexmark/html/AttributeProvider;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/vladsch/flexmark/html/EmbeddedAttributeProvider$EmbeddedNodeAttributes;
    }
.end annotation


# static fields
.field public static final Factory:Lcom/vladsch/flexmark/html/IndependentAttributeProviderFactory;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 14
    new-instance v0, Lcom/vladsch/flexmark/html/EmbeddedAttributeProvider$1;

    invoke-direct {v0}, Lcom/vladsch/flexmark/html/EmbeddedAttributeProvider$1;-><init>()V

    sput-object v0, Lcom/vladsch/flexmark/html/EmbeddedAttributeProvider;->Factory:Lcom/vladsch/flexmark/html/IndependentAttributeProviderFactory;

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .line 22
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/vladsch/flexmark/html/EmbeddedAttributeProvider$1;)V
    .locals 0

    .line 12
    invoke-direct {p0}, Lcom/vladsch/flexmark/html/EmbeddedAttributeProvider;-><init>()V

    return-void
.end method


# virtual methods
.method public setAttributes(Lcom/vladsch/flexmark/util/ast/Node;Lcom/vladsch/flexmark/html/renderer/AttributablePart;Lcom/vladsch/flexmark/util/html/Attributes;)V
    .locals 2

    .line 27
    sget-object v0, Lcom/vladsch/flexmark/html/renderer/AttributablePart;->NODE:Lcom/vladsch/flexmark/html/renderer/AttributablePart;

    if-ne p2, v0, :cond_0

    const/4 p2, 0x1

    .line 28
    new-array p2, p2, [Ljava/lang/Class;

    const-class v0, Lcom/vladsch/flexmark/html/EmbeddedAttributeProvider$EmbeddedNodeAttributes;

    const/4 v1, 0x0

    aput-object v0, p2, v1

    invoke-virtual {p1, p2}, Lcom/vladsch/flexmark/util/ast/Node;->getChildOfType([Ljava/lang/Class;)Lcom/vladsch/flexmark/util/ast/Node;

    move-result-object p1

    .line 29
    instance-of p2, p1, Lcom/vladsch/flexmark/html/EmbeddedAttributeProvider$EmbeddedNodeAttributes;

    if-eqz p2, :cond_0

    .line 30
    check-cast p1, Lcom/vladsch/flexmark/html/EmbeddedAttributeProvider$EmbeddedNodeAttributes;

    iget-object p1, p1, Lcom/vladsch/flexmark/html/EmbeddedAttributeProvider$EmbeddedNodeAttributes;->attributes:Lcom/vladsch/flexmark/util/html/Attributes;

    invoke-virtual {p3, p1}, Lcom/vladsch/flexmark/util/html/Attributes;->addValues(Lcom/vladsch/flexmark/util/html/Attributes;)Lcom/vladsch/flexmark/util/html/Attributes;

    :cond_0
    return-void
.end method
