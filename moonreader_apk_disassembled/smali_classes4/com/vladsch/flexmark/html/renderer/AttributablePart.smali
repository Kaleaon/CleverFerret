.class public Lcom/vladsch/flexmark/html/renderer/AttributablePart;
.super Ljava/lang/Object;
.source "AttributablePart.java"


# static fields
.field public static final ID:Lcom/vladsch/flexmark/html/renderer/AttributablePart;

.field public static final LINK:Lcom/vladsch/flexmark/html/renderer/AttributablePart;

.field public static final NODE:Lcom/vladsch/flexmark/html/renderer/AttributablePart;

.field public static final NODE_POSITION:Lcom/vladsch/flexmark/html/renderer/AttributablePart;


# instance fields
.field private final myName:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 7
    new-instance v0, Lcom/vladsch/flexmark/html/renderer/AttributablePart;

    const-string v1, "NODE"

    invoke-direct {v0, v1}, Lcom/vladsch/flexmark/html/renderer/AttributablePart;-><init>(Ljava/lang/String;)V

    sput-object v0, Lcom/vladsch/flexmark/html/renderer/AttributablePart;->NODE:Lcom/vladsch/flexmark/html/renderer/AttributablePart;

    .line 8
    new-instance v0, Lcom/vladsch/flexmark/html/renderer/AttributablePart;

    const-string v1, "NODE_POSITION"

    invoke-direct {v0, v1}, Lcom/vladsch/flexmark/html/renderer/AttributablePart;-><init>(Ljava/lang/String;)V

    sput-object v0, Lcom/vladsch/flexmark/html/renderer/AttributablePart;->NODE_POSITION:Lcom/vladsch/flexmark/html/renderer/AttributablePart;

    .line 9
    new-instance v0, Lcom/vladsch/flexmark/html/renderer/AttributablePart;

    const-string v1, "LINK"

    invoke-direct {v0, v1}, Lcom/vladsch/flexmark/html/renderer/AttributablePart;-><init>(Ljava/lang/String;)V

    sput-object v0, Lcom/vladsch/flexmark/html/renderer/AttributablePart;->LINK:Lcom/vladsch/flexmark/html/renderer/AttributablePart;

    .line 10
    new-instance v0, Lcom/vladsch/flexmark/html/renderer/AttributablePart;

    const-string v1, "ID"

    invoke-direct {v0, v1}, Lcom/vladsch/flexmark/html/renderer/AttributablePart;-><init>(Ljava/lang/String;)V

    sput-object v0, Lcom/vladsch/flexmark/html/renderer/AttributablePart;->ID:Lcom/vladsch/flexmark/html/renderer/AttributablePart;

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .locals 0

    .line 14
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 15
    iput-object p1, p0, Lcom/vladsch/flexmark/html/renderer/AttributablePart;->myName:Ljava/lang/String;

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

    .line 19
    iget-object v0, p0, Lcom/vladsch/flexmark/html/renderer/AttributablePart;->myName:Ljava/lang/String;

    return-object v0
.end method

.method public hashCode()I
    .locals 1

    .line 29
    invoke-super {p0}, Ljava/lang/Object;->hashCode()I

    move-result v0

    return v0
.end method
