.class public Lcom/vladsch/flexmark/util/html/ui/Color;
.super Ljava/awt/Color;
.source "Color.java"


# static fields
.field public static final BLACK:Lcom/vladsch/flexmark/util/html/ui/Color;

.field public static final BLUE:Lcom/vladsch/flexmark/util/html/ui/Color;

.field public static final CYAN:Lcom/vladsch/flexmark/util/html/ui/Color;

.field public static final DARK_GRAY:Lcom/vladsch/flexmark/util/html/ui/Color;

.field public static final GRAY:Lcom/vladsch/flexmark/util/html/ui/Color;

.field public static final GREEN:Lcom/vladsch/flexmark/util/html/ui/Color;

.field public static final LIGHT_GRAY:Lcom/vladsch/flexmark/util/html/ui/Color;

.field public static final MAGENTA:Lcom/vladsch/flexmark/util/html/ui/Color;

.field public static final NULL:Lcom/vladsch/flexmark/util/html/ui/Color;

.field public static final ORANGE:Lcom/vladsch/flexmark/util/html/ui/Color;

.field public static final PINK:Lcom/vladsch/flexmark/util/html/ui/Color;

.field public static final RED:Lcom/vladsch/flexmark/util/html/ui/Color;

.field public static final WHITE:Lcom/vladsch/flexmark/util/html/ui/Color;

.field public static final YELLOW:Lcom/vladsch/flexmark/util/html/ui/Color;


# direct methods
.method static constructor <clinit>()V
    .locals 4

    .line 22
    new-instance v0, Lcom/vladsch/flexmark/util/html/ui/Color;

    new-instance v1, Ljava/awt/Color;

    const/4 v2, 0x0

    const/4 v3, 0x1

    invoke-direct {v1, v2, v3}, Ljava/awt/Color;-><init>(IZ)V

    invoke-direct {v0, v1}, Lcom/vladsch/flexmark/util/html/ui/Color;-><init>(Ljava/awt/Color;)V

    sput-object v0, Lcom/vladsch/flexmark/util/html/ui/Color;->NULL:Lcom/vladsch/flexmark/util/html/ui/Color;

    .line 23
    new-instance v0, Lcom/vladsch/flexmark/util/html/ui/Color;

    sget-object v1, Ljava/awt/Color;->WHITE:Ljava/awt/Color;

    invoke-direct {v0, v1}, Lcom/vladsch/flexmark/util/html/ui/Color;-><init>(Ljava/awt/Color;)V

    sput-object v0, Lcom/vladsch/flexmark/util/html/ui/Color;->WHITE:Lcom/vladsch/flexmark/util/html/ui/Color;

    .line 24
    new-instance v0, Lcom/vladsch/flexmark/util/html/ui/Color;

    sget-object v1, Ljava/awt/Color;->LIGHT_GRAY:Ljava/awt/Color;

    invoke-direct {v0, v1}, Lcom/vladsch/flexmark/util/html/ui/Color;-><init>(Ljava/awt/Color;)V

    sput-object v0, Lcom/vladsch/flexmark/util/html/ui/Color;->LIGHT_GRAY:Lcom/vladsch/flexmark/util/html/ui/Color;

    .line 25
    new-instance v0, Lcom/vladsch/flexmark/util/html/ui/Color;

    sget-object v1, Ljava/awt/Color;->GRAY:Ljava/awt/Color;

    invoke-direct {v0, v1}, Lcom/vladsch/flexmark/util/html/ui/Color;-><init>(Ljava/awt/Color;)V

    sput-object v0, Lcom/vladsch/flexmark/util/html/ui/Color;->GRAY:Lcom/vladsch/flexmark/util/html/ui/Color;

    .line 26
    new-instance v0, Lcom/vladsch/flexmark/util/html/ui/Color;

    sget-object v1, Ljava/awt/Color;->DARK_GRAY:Ljava/awt/Color;

    invoke-direct {v0, v1}, Lcom/vladsch/flexmark/util/html/ui/Color;-><init>(Ljava/awt/Color;)V

    sput-object v0, Lcom/vladsch/flexmark/util/html/ui/Color;->DARK_GRAY:Lcom/vladsch/flexmark/util/html/ui/Color;

    .line 27
    new-instance v0, Lcom/vladsch/flexmark/util/html/ui/Color;

    sget-object v1, Ljava/awt/Color;->BLACK:Ljava/awt/Color;

    invoke-direct {v0, v1}, Lcom/vladsch/flexmark/util/html/ui/Color;-><init>(Ljava/awt/Color;)V

    sput-object v0, Lcom/vladsch/flexmark/util/html/ui/Color;->BLACK:Lcom/vladsch/flexmark/util/html/ui/Color;

    .line 28
    new-instance v0, Lcom/vladsch/flexmark/util/html/ui/Color;

    sget-object v1, Ljava/awt/Color;->RED:Ljava/awt/Color;

    invoke-direct {v0, v1}, Lcom/vladsch/flexmark/util/html/ui/Color;-><init>(Ljava/awt/Color;)V

    sput-object v0, Lcom/vladsch/flexmark/util/html/ui/Color;->RED:Lcom/vladsch/flexmark/util/html/ui/Color;

    .line 29
    new-instance v0, Lcom/vladsch/flexmark/util/html/ui/Color;

    sget-object v1, Ljava/awt/Color;->PINK:Ljava/awt/Color;

    invoke-direct {v0, v1}, Lcom/vladsch/flexmark/util/html/ui/Color;-><init>(Ljava/awt/Color;)V

    sput-object v0, Lcom/vladsch/flexmark/util/html/ui/Color;->PINK:Lcom/vladsch/flexmark/util/html/ui/Color;

    .line 30
    new-instance v0, Lcom/vladsch/flexmark/util/html/ui/Color;

    sget-object v1, Ljava/awt/Color;->ORANGE:Ljava/awt/Color;

    invoke-direct {v0, v1}, Lcom/vladsch/flexmark/util/html/ui/Color;-><init>(Ljava/awt/Color;)V

    sput-object v0, Lcom/vladsch/flexmark/util/html/ui/Color;->ORANGE:Lcom/vladsch/flexmark/util/html/ui/Color;

    .line 31
    new-instance v0, Lcom/vladsch/flexmark/util/html/ui/Color;

    sget-object v1, Ljava/awt/Color;->YELLOW:Ljava/awt/Color;

    invoke-direct {v0, v1}, Lcom/vladsch/flexmark/util/html/ui/Color;-><init>(Ljava/awt/Color;)V

    sput-object v0, Lcom/vladsch/flexmark/util/html/ui/Color;->YELLOW:Lcom/vladsch/flexmark/util/html/ui/Color;

    .line 32
    new-instance v0, Lcom/vladsch/flexmark/util/html/ui/Color;

    sget-object v1, Ljava/awt/Color;->GREEN:Ljava/awt/Color;

    invoke-direct {v0, v1}, Lcom/vladsch/flexmark/util/html/ui/Color;-><init>(Ljava/awt/Color;)V

    sput-object v0, Lcom/vladsch/flexmark/util/html/ui/Color;->GREEN:Lcom/vladsch/flexmark/util/html/ui/Color;

    .line 33
    new-instance v0, Lcom/vladsch/flexmark/util/html/ui/Color;

    sget-object v1, Ljava/awt/Color;->MAGENTA:Ljava/awt/Color;

    invoke-direct {v0, v1}, Lcom/vladsch/flexmark/util/html/ui/Color;-><init>(Ljava/awt/Color;)V

    sput-object v0, Lcom/vladsch/flexmark/util/html/ui/Color;->MAGENTA:Lcom/vladsch/flexmark/util/html/ui/Color;

    .line 34
    new-instance v0, Lcom/vladsch/flexmark/util/html/ui/Color;

    sget-object v1, Ljava/awt/Color;->CYAN:Ljava/awt/Color;

    invoke-direct {v0, v1}, Lcom/vladsch/flexmark/util/html/ui/Color;-><init>(Ljava/awt/Color;)V

    sput-object v0, Lcom/vladsch/flexmark/util/html/ui/Color;->CYAN:Lcom/vladsch/flexmark/util/html/ui/Color;

    .line 35
    new-instance v0, Lcom/vladsch/flexmark/util/html/ui/Color;

    sget-object v1, Ljava/awt/Color;->BLUE:Ljava/awt/Color;

    invoke-direct {v0, v1}, Lcom/vladsch/flexmark/util/html/ui/Color;-><init>(Ljava/awt/Color;)V

    sput-object v0, Lcom/vladsch/flexmark/util/html/ui/Color;->BLUE:Lcom/vladsch/flexmark/util/html/ui/Color;

    return-void
.end method

.method protected constructor <init>(I)V
    .locals 0

    .line 39
    invoke-direct {p0, p1}, Ljava/awt/Color;-><init>(I)V

    return-void
.end method

.method protected constructor <init>(Ljava/awt/Color;)V
    .locals 0

    .line 37
    invoke-virtual {p1}, Ljava/awt/Color;->getRGB()I

    move-result p1

    invoke-direct {p0, p1}, Ljava/awt/Color;-><init>(I)V

    return-void
.end method

.method public static of(I)Lcom/vladsch/flexmark/util/html/ui/Color;
    .locals 1

    .line 43
    new-instance v0, Lcom/vladsch/flexmark/util/html/ui/Color;

    invoke-direct {v0, p0}, Lcom/vladsch/flexmark/util/html/ui/Color;-><init>(I)V

    return-object v0
.end method

.method public static of(Ljava/awt/Color;)Lcom/vladsch/flexmark/util/html/ui/Color;
    .locals 1

    .line 41
    new-instance v0, Lcom/vladsch/flexmark/util/html/ui/Color;

    invoke-direct {v0, p0}, Lcom/vladsch/flexmark/util/html/ui/Color;-><init>(Ljava/awt/Color;)V

    return-object v0
.end method

.method public static of(Ljava/lang/String;)Lcom/vladsch/flexmark/util/html/ui/Color;
    .locals 1

    .line 46
    invoke-static {p0}, Lcom/vladsch/flexmark/util/html/ui/ColorStyler;->getNamedColor(Ljava/lang/String;)Ljava/awt/Color;

    move-result-object p0

    if-nez p0, :cond_0

    .line 47
    sget-object p0, Lcom/vladsch/flexmark/util/html/ui/Color;->NULL:Lcom/vladsch/flexmark/util/html/ui/Color;

    return-object p0

    :cond_0
    new-instance v0, Lcom/vladsch/flexmark/util/html/ui/Color;

    invoke-direct {v0, p0}, Lcom/vladsch/flexmark/util/html/ui/Color;-><init>(Ljava/awt/Color;)V

    return-object v0
.end method


# virtual methods
.method public toString()Ljava/lang/String;
    .locals 2

    .line 52
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "Color { "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-static {p0}, Lcom/vladsch/flexmark/util/html/ui/HtmlHelpers;->toHtmlString(Ljava/awt/Color;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, " "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static {p0}, Lcom/vladsch/flexmark/util/html/ui/HtmlHelpers;->toRgbString(Ljava/awt/Color;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "}"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
