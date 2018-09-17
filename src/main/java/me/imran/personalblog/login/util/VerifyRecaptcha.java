package me.imran.personalblog.login.util;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;

import org.springframework.context.annotation.Bean;
import org.springframework.stereotype.Component;
import org.springframework.util.StringUtils;
import org.springframework.web.client.RestOperations;
import org.springframework.web.client.RestTemplate;

import java.net.URI;
import java.util.regex.Pattern;




import com.fasterxml.jackson.annotation.*;

import java.util.Arrays;
import java.util.HashMap;
import java.util.Map;
/**
 * @author Imran Hossain
 */
@JsonInclude(JsonInclude.Include.NON_NULL)
@JsonIgnoreProperties(ignoreUnknown = true)
@JsonPropertyOrder({ "success", "challenge_ts", "hostname", "error-codes" })
class GoogleResponse {

    @JsonProperty("success")
    private boolean success;
    @JsonProperty("challenge_ts")
    private String challengeTs;
    @JsonProperty("hostname")
    private String hostname;
    @JsonProperty("error-codes")
    private ErrorCode[] errorCodes;

    static enum ErrorCode {
        MissingSecret, InvalidSecret, MissingResponse, InvalidResponse;

        private static Map<String, ErrorCode> errorsMap = new HashMap<String, ErrorCode>(4);

        static {
            errorsMap.put("missing-input-secret", MissingSecret);
            errorsMap.put("invalid-input-secret", InvalidSecret);
            errorsMap.put("missing-input-response", MissingResponse);
            errorsMap.put("invalid-input-response", InvalidResponse);
        }

        @JsonCreator
        public static ErrorCode forValue(final String value) {
            return errorsMap.get(value.toLowerCase());
        }
    }

    @JsonProperty("success")
    public boolean isSuccess() {
        return success;
    }

    @JsonProperty("success")
    public void setSuccess(boolean success) {
        this.success = success;
    }

    @JsonProperty("challenge_ts")
    public String getChallengeTs() {
        return challengeTs;
    }

    @JsonProperty("challenge_ts")
    public void setChallengeTs(String challengeTs) {
        this.challengeTs = challengeTs;
    }

    @JsonProperty("hostname")
    public String getHostname() {
        return hostname;
    }

    @JsonProperty("hostname")
    public void setHostname(String hostname) {
        this.hostname = hostname;
    }

    @JsonProperty("error-codes")
    public void setErrorCodes(ErrorCode[] errorCodes) {
        this.errorCodes = errorCodes;
    }

    @JsonProperty("error-codes")
    public ErrorCode[] getErrorCodes() {
        return errorCodes;
    }

    @JsonIgnore
    public boolean hasClientError() {
        final ErrorCode[] errors = getErrorCodes();
        if (errors == null) {
            return false;
        }
        for (final ErrorCode error : errors) {
            switch (error) {
                case InvalidResponse:
                case MissingResponse:
                    return true;
                default:
                    break;
            }
        }
        return false;
    }

    @Override
    public String toString() {
        return "GoogleResponse{" + "success=" + success + ", challengeTs='" + challengeTs + '\'' + ", hostname='" + hostname + '\'' + ", errorCodes=" + Arrays.toString(errorCodes) + '}';
    }
}



/**
 * @author Imran Hossain
 */
@Component
public class VerifyRecaptcha {
    private static final Logger logger2 = LoggerFactory.getLogger(VerifyRecaptcha.class);

    @Value("${recaptcha.validation.url}")
    private String url;

    @Value("${recaptcha.validation.secretKey}")
    private String secret;


    @Autowired
    private RestOperations restTemplate;

    private static Pattern RESPONSE_PATTERN = Pattern.compile("[A-Za-z0-9_-]+");
    @Bean
    public RestTemplate restTemplate() {
        return new RestTemplate();
    }

    public Boolean verify(String response) {
        if(!responseSanityCheck(response)) {
            return false;
        }

        URI verifyUri = URI.create(String.format(
                url+"?secret=%s&response=%s",
                secret, response));

        GoogleResponse googleResponse = restTemplate.getForObject(verifyUri, GoogleResponse.class);

        if(!googleResponse.isSuccess()) {
            return false;

        }
        return true;
    }

    private boolean responseSanityCheck(String response) {
        return StringUtils.hasLength(response) && RESPONSE_PATTERN.matcher(response).matches();
    }
}
