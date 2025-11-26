.class public Lcom/vladsch/flexmark/html/renderer/LinkStatus;
.super Ljava/lang/Object;
.source "LinkStatus.java"


# static fields
.field public static final INVALID:Lcom/vladsch/flexmark/html/renderer/LinkStatus;

.field public static final NOT_FOUND:Lcom/vladsch/flexmark/html/renderer/LinkStatus;

.field public static final UNCHECKED:Lcom/vladsch/flexmark/html/renderer/LinkStatus;

.field public static final UNKNOWN:Lcom/vladsch/flexmark/html/renderer/LinkStatus;

.field public static final VALID:Lcom/vladsch/flexmark/html/renderer/LinkStatus;


# instance fields
.field private final myName:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 4
    new-instance v0, Lcom/vladsch/flexmark/html/renderer/LinkStatus;

    const-string v1, "UNKNOWN"

    invoke-direct {v0, v1}, Lcom/vladsch/flexmark/html/renderer/LinkStatus;-><init>(Ljava/lang/String;)V

    sput-object v0, Lcom/vladsch/flexmark/html/renderer/LinkStatus;->UNKNOWN:Lcom/vladsch/flexmark/html/renderer/LinkStatus;

    .line 5
    new-instance v0, Lcom/vladsch/flexmark/html/renderer/LinkStatus;

    const-string v1, "VALID"

    invoke-direct {v0, v1}, Lcom/vladsch/flexmark/html/renderer/LinkStatus;-><init>(Ljava/lang/String;)V

    sput-object v0, Lcom/vladsch/flexmark/html/renderer/LinkStatus;->VALID:Lcom/vladsch/flexmark/html/renderer/LinkStatus;

    .line 6
    new-instance v0, Lcom/vladsch/flexmark/html/renderer/LinkStatus;

    const-string v1, "INVALID"

    invoke-direct {v0, v1}, Lcom/vladsch/flexmark/html/renderer/LinkStatus;-><init>(Ljava/lang/String;)V

    sput-object v0, Lcom/vladsch/flexmark/html/renderer/LinkStatus;->INVALID:Lcom/vladsch/flexmark/html/renderer/LinkStatus;

    .line 7
    new-instance v0, Lcom/vladsch/flexmark/html/renderer/LinkStatus;

    const-string v1, "UNCHECKED"

    invoke-direct {v0, v1}, Lcom/vladsch/flexmark/html/renderer/LinkStatus;-><init>(Ljava/lang/String;)V

    sput-object v0, Lcom/vladsch/flexmark/html/renderer/LinkStatus;->UNCHECKED:Lcom/vladsch/flexmark/html/renderer/LinkStatus;

    .line 8
    new-instance v0, Lcom/vladsch/flexmark/html/renderer/LinkStatus;

    const-string v1, "NOT_FOUND"

    invoke-direct {v0, v1}, Lcom/vladsch/flexmark/html/renderer/LinkStatus;-><init>(Ljava/lang/String;)V

    sput-object v0, Lcom/vladsch/flexmark/html/renderer/LinkStatus;->NOT_FOUND:Lcom/vladsch/flexmark/html/renderer/LinkStatus;

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .locals 0

    .line 12
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 13
    iput-object p1, p0, Lcom/vladsch/flexmark/html/renderer/LinkStatus;->myName:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .locals 1

    if-ne p0, p1, :cond_0

    const/4 p1, 0x1

    return p1

    .line 23
    :cond_0
    instance-of v0, p1, Lcom/vladsch/flexmark/html/renderer/LinkStatus;

    if-nez v0, :cond_1

    const/4 p1, 0x0

    return p1

    .line 25
    :cond_1
    check-cast p1, Lcom/vladsch/flexmark/html/renderer/LinkStatus;

    .line 27
    iget-object v0, p0, Lcom/vladsch/flexmark/html/renderer/LinkStatus;->myName:Ljava/lang/String;

    iget-object p1, p1, Lcom/vladsch/flexmark/html/renderer/LinkStatus;->myName:Ljava/lang/String;

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    return p1
.end method

.method public getName()Ljava/lang/String;
    .locals 1

    .line 17
    iget-object v0, p0, Lcom/vladsch/flexmark/html/renderer/LinkStatus;->myName:Ljava/lang/String;

    return-object v0
.end method

.method public hashCode()I
    .locals 1

    .line 32
    iget-object v0, p0, Lcom/vladsch/flexmark/html/renderer/LinkStatus;->myName:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->hashCode()I

    move-result v0

    return v0
.end method

.method public isStatus(Ljava/lang/CharSequence;)Z
    .locals 2

    .line 36
    iget-object v0, p0, Lcom/vladsch/flexmark/html/renderer/LinkStatus;->myName:Ljava/lang/String;

    instance-of v1, p1, Ljava/lang/String;

    if-eqz v1, :cond_0

    check-cast p1, Ljava/lang/String;

    goto :goto_0

    :cond_0
    invoke-static {p1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    :goto_0
    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    return p1
.end method
