.class public Lcom/vladsch/flexmark/html/renderer/LinkType;
.super Ljava/lang/Object;
.source "LinkType.java"


# static fields
.field public static final IMAGE:Lcom/vladsch/flexmark/html/renderer/LinkType;

.field public static final IMAGE_REF:Lcom/vladsch/flexmark/html/renderer/LinkType;

.field public static final LINK:Lcom/vladsch/flexmark/html/renderer/LinkType;

.field public static final LINK_REF:Lcom/vladsch/flexmark/html/renderer/LinkType;


# instance fields
.field private final myName:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 4
    new-instance v0, Lcom/vladsch/flexmark/html/renderer/LinkType;

    const-string v1, "LINK"

    invoke-direct {v0, v1}, Lcom/vladsch/flexmark/html/renderer/LinkType;-><init>(Ljava/lang/String;)V

    sput-object v0, Lcom/vladsch/flexmark/html/renderer/LinkType;->LINK:Lcom/vladsch/flexmark/html/renderer/LinkType;

    .line 5
    new-instance v0, Lcom/vladsch/flexmark/html/renderer/LinkType;

    const-string v1, "IMAGE"

    invoke-direct {v0, v1}, Lcom/vladsch/flexmark/html/renderer/LinkType;-><init>(Ljava/lang/String;)V

    sput-object v0, Lcom/vladsch/flexmark/html/renderer/LinkType;->IMAGE:Lcom/vladsch/flexmark/html/renderer/LinkType;

    .line 6
    new-instance v0, Lcom/vladsch/flexmark/html/renderer/LinkType;

    const-string v1, "LINK_REF"

    invoke-direct {v0, v1}, Lcom/vladsch/flexmark/html/renderer/LinkType;-><init>(Ljava/lang/String;)V

    sput-object v0, Lcom/vladsch/flexmark/html/renderer/LinkType;->LINK_REF:Lcom/vladsch/flexmark/html/renderer/LinkType;

    .line 7
    new-instance v0, Lcom/vladsch/flexmark/html/renderer/LinkType;

    const-string v1, "IMAGE_REF"

    invoke-direct {v0, v1}, Lcom/vladsch/flexmark/html/renderer/LinkType;-><init>(Ljava/lang/String;)V

    sput-object v0, Lcom/vladsch/flexmark/html/renderer/LinkType;->IMAGE_REF:Lcom/vladsch/flexmark/html/renderer/LinkType;

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .locals 0

    .line 11
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 12
    iput-object p1, p0, Lcom/vladsch/flexmark/html/renderer/LinkType;->myName:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .locals 0

    if-ne p0, p1, :cond_0

    const/4 p1, 0x1

    return p1

    :cond_0
    const/4 p1, 0x0

    return p1
.end method

.method public getName()Ljava/lang/String;
    .locals 1

    .line 16
    iget-object v0, p0, Lcom/vladsch/flexmark/html/renderer/LinkType;->myName:Ljava/lang/String;

    return-object v0
.end method

.method public hashCode()I
    .locals 1

    .line 26
    invoke-super {p0}, Ljava/lang/Object;->hashCode()I

    move-result v0

    return v0
.end method
