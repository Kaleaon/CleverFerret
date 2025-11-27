.class public Lcom/vladsch/flexmark/util/html/ui/BackgroundColor;
.super Ljava/awt/Color;
.source "BackgroundColor.java"


# static fields
.field public static final BLACK:Lcom/vladsch/flexmark/util/html/ui/BackgroundColor;

.field public static final BLUE:Lcom/vladsch/flexmark/util/html/ui/BackgroundColor;

.field public static final CYAN:Lcom/vladsch/flexmark/util/html/ui/BackgroundColor;

.field public static final DARK_GRAY:Lcom/vladsch/flexmark/util/html/ui/BackgroundColor;

.field public static final GRAY:Lcom/vladsch/flexmark/util/html/ui/BackgroundColor;

.field public static final GREEN:Lcom/vladsch/flexmark/util/html/ui/BackgroundColor;

.field public static final LIGHT_GRAY:Lcom/vladsch/flexmark/util/html/ui/BackgroundColor;

.field public static final MAGENTA:Lcom/vladsch/flexmark/util/html/ui/BackgroundColor;

.field public static final NULL:Lcom/vladsch/flexmark/util/html/ui/BackgroundColor;

.field public static final ORANGE:Lcom/vladsch/flexmark/util/html/ui/BackgroundColor;

.field public static final PINK:Lcom/vladsch/flexmark/util/html/ui/BackgroundColor;

.field public static final RED:Lcom/vladsch/flexmark/util/html/ui/BackgroundColor;

.field public static final WHITE:Lcom/vladsch/flexmark/util/html/ui/BackgroundColor;

.field public static final YELLOW:Lcom/vladsch/flexmark/util/html/ui/BackgroundColor;


# direct methods
.method static constructor <clinit>()V
    .locals 4

    .line 24
    new-instance v0, Lcom/vladsch/flexmark/util/html/ui/BackgroundColor;

    new-instance v1, Ljava/awt/Color;

    const/4 v2, 0x0

    const/4 v3, 0x1

    invoke-direct {v1, v2, v3}, Ljava/awt/Color;-><init>(IZ)V

    invoke-direct {v0, v1}, Lcom/vladsch/flexmark/util/html/ui/BackgroundColor;-><init>(Ljava/awt/Color;)V

    sput-object v0, Lcom/vladsch/flexmark/util/html/ui/BackgroundColor;->NULL:Lcom/vladsch/flexmark/util/html/ui/BackgroundColor;

    .line 25
    new-instance v0, Lcom/vladsch/flexmark/util/html/ui/BackgroundColor;

    sget-object v1, Ljava/awt/Color;->WHITE:Ljava/awt/Color;

    invoke-direct {v0, v1}, Lcom/vladsch/flexmark/util/html/ui/BackgroundColor;-><init>(Ljava/awt/Color;)V

    sput-object v0, Lcom/vladsch/flexmark/util/html/ui/BackgroundColor;->WHITE:Lcom/vladsch/flexmark/util/html/ui/BackgroundColor;

    .line 26
    new-instance v0, Lcom/vladsch/flexmark/util/html/ui/BackgroundColor;

    sget-object v1, Ljava/awt/Color;->LIGHT_GRAY:Ljava/awt/Color;

    invoke-direct {v0, v1}, Lcom/vladsch/flexmark/util/html/ui/BackgroundColor;-><init>(Ljava/awt/Color;)V

    sput-object v0, Lcom/vladsch/flexmark/util/html/ui/BackgroundColor;->LIGHT_GRAY:Lcom/vladsch/flexmark/util/html/ui/BackgroundColor;

    .line 27
    new-instance v0, Lcom/vladsch/flexmark/util/html/ui/BackgroundColor;

    sget-object v1, Ljava/awt/Color;->GRAY:Ljava/awt/Color;

    invoke-direct {v0, v1}, Lcom/vladsch/flexmark/util/html/ui/BackgroundColor;-><init>(Ljava/awt/Color;)V

    sput-object v0, Lcom/vladsch/flexmark/util/html/ui/BackgroundColor;->GRAY:Lcom/vladsch/flexmark/util/html/ui/BackgroundColor;

    .line 28
    new-instance v0, Lcom/vladsch/flexmark/util/html/ui/BackgroundColor;

    sget-object v1, Ljava/awt/Color;->DARK_GRAY:Ljava/awt/Color;

    invoke-direct {v0, v1}, Lcom/vladsch/flexmark/util/html/ui/BackgroundColor;-><init>(Ljava/awt/Color;)V

    sput-object v0, Lcom/vladsch/flexmark/util/html/ui/BackgroundColor;->DARK_GRAY:Lcom/vladsch/flexmark/util/html/ui/BackgroundColor;

    .line 29
    new-instance v0, Lcom/vladsch/flexmark/util/html/ui/BackgroundColor;

    sget-object v1, Ljava/awt/Color;->BLACK:Ljava/awt/Color;

    invoke-direct {v0, v1}, Lcom/vladsch/flexmark/util/html/ui/BackgroundColor;-><init>(Ljava/awt/Color;)V

    sput-object v0, Lcom/vladsch/flexmark/util/html/ui/BackgroundColor;->BLACK:Lcom/vladsch/flexmark/util/html/ui/BackgroundColor;

    .line 30
    new-instance v0, Lcom/vladsch/flexmark/util/html/ui/BackgroundColor;

    sget-object v1, Ljava/awt/Color;->RED:Ljava/awt/Color;

    invoke-direct {v0, v1}, Lcom/vladsch/flexmark/util/html/ui/BackgroundColor;-><init>(Ljava/awt/Color;)V

    sput-object v0, Lcom/vladsch/flexmark/util/html/ui/BackgroundColor;->RED:Lcom/vladsch/flexmark/util/html/ui/BackgroundColor;

    .line 31
    new-instance v0, Lcom/vladsch/flexmark/util/html/ui/BackgroundColor;

    sget-object v1, Ljava/awt/Color;->PINK:Ljava/awt/Color;

    invoke-direct {v0, v1}, Lcom/vladsch/flexmark/util/html/ui/BackgroundColor;-><init>(Ljava/awt/Color;)V

    sput-object v0, Lcom/vladsch/flexmark/util/html/ui/BackgroundColor;->PINK:Lcom/vladsch/flexmark/util/html/ui/BackgroundColor;

    .line 32
    new-instance v0, Lcom/vladsch/flexmark/util/html/ui/BackgroundColor;

    sget-object v1, Ljava/awt/Color;->ORANGE:Ljava/awt/Color;

    invoke-direct {v0, v1}, Lcom/vladsch/flexmark/util/html/ui/BackgroundColor;-><init>(Ljava/awt/Color;)V

    sput-object v0, Lcom/vladsch/flexmark/util/html/ui/BackgroundColor;->ORANGE:Lcom/vladsch/flexmark/util/html/ui/BackgroundColor;

    .line 33
    new-instance v0, Lcom/vladsch/flexmark/util/html/ui/BackgroundColor;

    sget-object v1, Ljava/awt/Color;->YELLOW:Ljava/awt/Color;

    invoke-direct {v0, v1}, Lcom/vladsch/flexmark/util/html/ui/BackgroundColor;-><init>(Ljava/awt/Color;)V

    sput-object v0, Lcom/vladsch/flexmark/util/html/ui/BackgroundColor;->YELLOW:Lcom/vladsch/flexmark/util/html/ui/BackgroundColor;

    .line 34
    new-instance v0, Lcom/vladsch/flexmark/util/html/ui/BackgroundColor;

    sget-object v1, Ljava/awt/Color;->GREEN:Ljava/awt/Color;

    invoke-direct {v0, v1}, Lcom/vladsch/flexmark/util/html/ui/BackgroundColor;-><init>(Ljava/awt/Color;)V

    sput-object v0, Lcom/vladsch/flexmark/util/html/ui/BackgroundColor;->GREEN:Lcom/vladsch/flexmark/util/html/ui/BackgroundColor;

    .line 35
    new-instance v0, Lcom/vladsch/flexmark/util/html/ui/BackgroundColor;

    sget-object v1, Ljava/awt/Color;->MAGENTA:Ljava/awt/Color;

    invoke-direct {v0, v1}, Lcom/vladsch/flexmark/util/html/ui/BackgroundColor;-><init>(Ljava/awt/Color;)V

    sput-object v0, Lcom/vladsch/flexmark/util/html/ui/BackgroundColor;->MAGENTA:Lcom/vladsch/flexmark/util/html/ui/BackgroundColor;

    .line 36
    new-instance v0, Lcom/vladsch/flexmark/util/html/ui/BackgroundColor;

    sget-object v1, Ljava/awt/Color;->CYAN:Ljava/awt/Color;

    invoke-direct {v0, v1}, Lcom/vladsch/flexmark/util/html/ui/BackgroundColor;-><init>(Ljava/awt/Color;)V

    sput-object v0, Lcom/vladsch/flexmark/util/html/ui/BackgroundColor;->CYAN:Lcom/vladsch/flexmark/util/html/ui/BackgroundColor;

    .line 37
    new-instance v0, Lcom/vladsch/flexmark/util/html/ui/BackgroundColor;

    sget-object v1, Ljava/awt/Color;->BLUE:Ljava/awt/Color;

    invoke-direct {v0, v1}, Lcom/vladsch/flexmark/util/html/ui/BackgroundColor;-><init>(Ljava/awt/Color;)V

    sput-object v0, Lcom/vladsch/flexmark/util/html/ui/BackgroundColor;->BLUE:Lcom/vladsch/flexmark/util/html/ui/BackgroundColor;

    return-void
.end method

.method protected constructor <init>(I)V
    .locals 0

    .line 41
    invoke-direct {p0, p1}, Ljava/awt/Color;-><init>(I)V

    return-void
.end method

.method protected constructor <init>(Ljava/awt/Color;)V
    .locals 0

    .line 39
    invoke-virtual {p1}, Ljava/awt/Color;->getRGB()I

    move-result p1

    invoke-direct {p0, p1}, Ljava/awt/Color;-><init>(I)V

    return-void
.end method

.method public static of(I)Lcom/vladsch/flexmark/util/html/ui/BackgroundColor;
    .locals 1

    .line 45
    new-instance v0, Lcom/vladsch/flexmark/util/html/ui/BackgroundColor;

    invoke-direct {v0, p0}, Lcom/vladsch/flexmark/util/html/ui/BackgroundColor;-><init>(I)V

    return-object v0
.end method

.method public static of(Ljava/awt/Color;)Lcom/vladsch/flexmark/util/html/ui/BackgroundColor;
    .locals 1

    .line 43
    new-instance v0, Lcom/vladsch/flexmark/util/html/ui/BackgroundColor;

    invoke-direct {v0, p0}, Lcom/vladsch/flexmark/util/html/ui/BackgroundColor;-><init>(Ljava/awt/Color;)V

    return-object v0
.end method

.method public static of(Ljava/lang/String;)Lcom/vladsch/flexmark/util/html/ui/BackgroundColor;
    .locals 1

    .line 48
    invoke-static {p0}, Lcom/vladsch/flexmark/util/html/ui/ColorStyler;->getNamedColor(Ljava/lang/String;)Ljava/awt/Color;

    move-result-object p0

    if-nez p0, :cond_0

    .line 49
    sget-object p0, Lcom/vladsch/flexmark/util/html/ui/BackgroundColor;->NULL:Lcom/vladsch/flexmark/util/html/ui/BackgroundColor;

    return-object p0

    :cond_0
    new-instance v0, Lcom/vladsch/flexmark/util/html/ui/BackgroundColor;

    invoke-direct {v0, p0}, Lcom/vladsch/flexmark/util/html/ui/BackgroundColor;-><init>(Ljava/awt/Color;)V

    return-object v0
.end method
